﻿--abort;

CREATE TABLE streets
(
  gid serial NOT NULL,
  link_id integer,
  "name" character varying(90),
  l_refaddr integer,
  l_nrefaddr integer,
  l_sqlnumf character varying(12),
  l_sqlfmt character varying(16),
  l_cformat character varying(16),
  r_refaddr integer,
  r_nrefaddr integer,
  r_sqlnumf character varying(12),
  r_sqlfmt character varying(16),
  r_cformat character varying(16),
  l_ac5 character varying,
  l_ac4 character varying,
  l_ac3 character varying,
  l_ac2 character varying,
  l_ac1 character varying,
  r_ac5 character varying,
  r_ac4 character varying,
  r_ac3 character varying,
  r_ac2 character varying,
  r_ac1 character varying,
  l_postcode character varying(11),
  r_postcode character varying(11),
  the_geom geometry NOT NULL,
  CONSTRAINT streets_pkey PRIMARY KEY (gid),
  CONSTRAINT enforce_dims_the_geom CHECK (ndims(the_geom) = 2),
  CONSTRAINT enforce_geotype_the_geom CHECK (geometrytype(the_geom) = 'MULTILINESTRING'::text OR the_geom IS NULL),
  CONSTRAINT enforce_srid_the_geom CHECK (srid(the_geom) = 4326)
)
WITH (
  OIDS=FALSE
);

create table link_id (
    id serial not null primary key,
    nid character(32) not null unique
    );
    
insert into link_id (nid)
   select foo.nid from (
     select nid from roadseg
     union
     select nid from ferryseg
     ) as foo;

CREATE INDEX link_id_nid_idx ON link_id USING btree (nid ASC NULLS LAST);

--set enable_seqscan to false;

insert into streets 
    (link_id, name, l_refaddr, l_nrefaddr, r_refaddr, r_nrefaddr, l_ac5, l_ac2, l_ac1, r_ac5, r_ac2, r_ac1, the_geom )
  select
     b.id, 
     coalesce(nullif(l_stname_c,'None'),nullif(r_stname_c,'None')),
     case when l_adddirfg='Opposite Direction' and l_hnuml>0 then l_hnuml
          when l_adddirfg='Same Direction' and l_hnumf>0 then l_hnumf
          when l_adddirfg='Not Applicable' and l_hnumf>0 then l_hnumf end,
     case when l_adddirfg='Opposite Direction' and l_hnumf>0 then l_hnumf
          when l_adddirfg='Same Direction' and l_hnuml>0 then l_hnuml
          when l_adddirfg='Not Applicable' and l_hnuml>0 then l_hnuml end,
     case when l_adddirfg='Opposite Direction' and r_hnuml>0 then r_hnuml
          when l_adddirfg='Same Direction' and r_hnumf>0 then r_hnumf
          when l_adddirfg='Not Applicable' and r_hnumf>0 then r_hnumf end,
     case when l_adddirfg='Opposite Direction' and r_hnumf>0 then r_hnumf
          when l_adddirfg='Same Direction' and r_hnuml>0 then r_hnuml
          when l_adddirfg='Not Applicable' and r_hnuml>0 then r_hnuml end,
     l_placenam,
     datasetnam,
     'CA',
     r_placenam,
     datasetnam,
     'CA',
     st_transform(the_geom, 4326)
    from roadseg a, link_id b
   where a.nid=b.nid;
--Query returned successfully: 389404 rows affected, 30455 ms execution time.

CREATE INDEX roadseg_gidx ON roadseg USING gist (the_geom);

insert into streets 
    (link_id, name, l_ac5, l_ac2, l_ac1, r_ac5, r_ac2, r_ac1, the_geom )
  select
     b.id, 
     'Ferry' || coalesce(' on ' || coalesce(nullif(l_stname_c,'None'),nullif(r_stname_c,'None')), ''),
     l_placenam,
     c.datasetnam,
     'CA',
     r_placenam,
     c.datasetnam,
     'CA',
     st_transform(c.the_geom, 4326)
    from ferryseg c, roadseg a, link_id b
   where a.nid=b.nid and st_dwithin(st_startpoint(c.the_geom), a.the_geom, 0.000001);
-- Query returned successfully: 7 rows affected, 22 ms execution time.



CREATE INDEX streets_gidx
  ON streets
  USING gist
  (the_geom);
ALTER TABLE streets CLUSTER ON streets_gidx;

CREATE OR REPLACE FUNCTION comma_cat(text[], text)
  RETURNS text[] AS
$BODY$
  SELECT
    CASE WHEN $1 @> ARRAY[$2] THEN $1
    ELSE $1 || $2
  END
$BODY$
  LANGUAGE 'sql' VOLATILE;

CREATE OR REPLACE FUNCTION comma_finish(text[])
  RETURNS text AS
$BODY$
    SELECT array_to_string($1, ', ')
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;

DROP AGGREGATE IF EXISTS list (text);
CREATE AGGREGATE list (BASETYPE = text, SFUNC = comma_cat, STYPE = text[], FINALFUNC = comma_finish, INITCOND = '{NULL, NULL}');


-- Function: imt_intersection_point_to_id(geometry, double precision)

-- DROP FUNCTION imt_intersection_point_to_id(geometry, double precision);

CREATE OR REPLACE FUNCTION imt_intersection_point_to_id(point geometry, tolerance double precision)
  RETURNS integer AS
$BODY$
DECLARE
        row record;
        point_id int;
BEGIN
        LOOP
                SELECT INTO row id, the_geom FROM intersections_tmp WHERE
                   expand(point, tolerance) && the_geom and
                   distance(the_geom, point) < tolerance;

                point_id := row.id;

                IF NOT FOUND THEN
                        INSERT INTO intersections_tmp (the_geom) VALUES (point);
                ELSE
                        EXIT;
                END IF;
        END LOOP;
        RETURN point_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100;
ALTER FUNCTION imt_intersection_point_to_id(geometry, double precision) OWNER TO postgres;


-- Function: imt_make_intersections(character varying, double precision, character varying, character varying)

-- DROP FUNCTION imt_make_intersections(character varying, double precision, character varying, character varying);

CREATE OR REPLACE FUNCTION imt_make_intersections(geom_table character varying, tolerance double precision, geo_cname character varying, gid_cname character varying)
  RETURNS character varying AS
$BODY$
DECLARE
    points record;
    source_id int;
    target_id int;
    srid integer;
    countids integer;

BEGIN
    BEGIN
        DROP TABLE intersections_tmp;
        EXCEPTION
            WHEN UNDEFINED_TABLE THEN
        END;
    BEGIN
        DROP TABLE st_vert_tmp;
        EXCEPTION
            WHEN UNDEFINED_TABLE THEN
        END;

        EXECUTE 'CREATE TABLE intersections_tmp (id serial, cnt integer, dcnt integer)';

        EXECUTE 'SELECT srid FROM geometry_columns WHERE f_table_name='|| quote_literal(geom_table) INTO srid;

        EXECUTE 'SELECT count(*) as countids FROM '|| quote_ident(geom_table) INTO countids;

        EXECUTE 'SELECT addGeometryColumn(''intersections_tmp'', ''the_geom'', '||srid||', ''POINT'', 2)';

        CREATE INDEX intersections_tmp_idx ON intersections_tmp USING GIST (the_geom);

        EXECUTE 'CREATE TABLE st_vert_tmp (gid integer, vid integer, wend char(1))';

        FOR points IN EXECUTE 'SELECT ' || quote_ident(gid_cname) || ' AS id,'
                || ' PointN('|| quote_ident(geo_cname) ||', 1) AS source,'
                || ' PointN('|| quote_ident(geo_cname) ||', NumPoints('
                || quote_ident(geo_cname) ||')) AS target'
                || ' FROM ' || quote_ident(geom_table) || ' ORDER BY '
                || quote_ident(gid_cname)
            loop

                IF points.id%1000=0 THEN
                      RAISE NOTICE '% out of % edges processed', points.id, countids;
                END IF;

                source_id := imt_intersection_point_to_id(setsrid(points.source, srid), tolerance);
                target_id := imt_intersection_point_to_id(setsrid(points.target, srid), tolerance);

                INSERT INTO st_vert_tmp values(points.id, source_id, 'S');
                INSERT INTO st_vert_tmp values(points.id, target_id, 'T');

        END LOOP;


        create index st_vert_tmp_vid_idx on st_vert_tmp using btree (vid);
        create index st_vert_tmp_gid_idx on st_vert_tmp using btree (gid);
        CREATE INDEX intersections_tmp_id_idx ON intersections_tmp USING btree (id ASC NULLS LAST);
        CREATE INDEX intersections_tmp_dcnt_idx ON intersections_tmp USING btree (dcnt ASC NULLS LAST);
        DROP INDEX IF EXISTS streets_gid_idx;
        CREATE INDEX streets_gid_idx ON streets USING btree (gid ASC NULLS LAST);
/*
        update intersections_tmp as a set
          cnt  = (select count(*) from st_vert_tmp b where b.vid=a.id),
          dcnt = (select count(distinct name) from st_vert_tmp b, streets c where b.gid=c.gid and b.vid=a.id and c.name is not null);
*/
    RETURN 'OK';

/*
    -- The following are various uses of these tables

    -- get a count of intersections with multiple street names
    select count(*) from intersections_tmp where dcnt>1;

    -- see a sample of the intersections and the street names
    select distinct a.id, c.name
      from intersections_tmp a, st_vert_tmp b, streets c
     where a.id=b.vid and b.gid=c.gid and a.dcnt>1 and c.name is not null
     order by a.id, c.name
     limit 100;

    -- find the nearest intersection to a point
     select a.id, round(distance_sphere(setsrid(makepoint(-90.51791, 14.61327), 4326), a.the_geom)::numeric,1) as dist, list(c.name),
            c.r_ac5, c.r_ac4, c.r_ac3, c.r_ac2, c.r_ac1
      from intersections_tmp a, st_vert_tmp b, streets c
     where a.id=b.vid and b.gid=c.gid and a.dcnt>1 and c.name is not null
       and expand(setsrid(makepoint(-90.51791, 14.61327), 4326), 0.0013) && a.the_geom
     group by a.id, dist, c.r_ac5, c.r_ac4, c.r_ac3, c.r_ac2, c.r_ac1
     order by dist, a.id;


*/

END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100;
ALTER FUNCTION imt_make_intersections(character varying, double precision, character varying, character varying) OWNER TO postgres;


-- Function: imt_make_intersections(character varying, double precision, character varying, character varying, text)

-- DROP FUNCTION imt_make_intersections(character varying, double precision, character varying, character varying, text);

CREATE OR REPLACE FUNCTION imt_make_intersections(geom_table character varying, tolerance double precision, geo_cname character varying, gid_cname character varying, where_str text)
  RETURNS character varying AS
$BODY$
DECLARE
    points record;
    source_id int;
    target_id int;
    srid integer;
    countids integer;
    where_clause text;

BEGIN
    BEGIN
        DROP TABLE intersections_tmp;
        EXCEPTION
            WHEN UNDEFINED_TABLE THEN
        END;
    BEGIN
        DROP TABLE st_vert_tmp;
        EXCEPTION
            WHEN UNDEFINED_TABLE THEN
        END;

        where_clause := coalesce(where_str, '');

        EXECUTE 'CREATE TABLE intersections_tmp (id serial, cnt integer, dcnt integer)';

        EXECUTE 'SELECT srid FROM geometry_columns WHERE f_table_name='|| quote_literal(geom_table) INTO srid;

        EXECUTE 'SELECT count(*) as countids FROM '|| quote_ident(geom_table) || ' ' || where_clause INTO countids;

        EXECUTE 'SELECT addGeometryColumn(''intersections_tmp'', ''the_geom'', '||srid||', ''POINT'', 2)';

        CREATE INDEX intersections_tmp_idx ON intersections_tmp USING GIST (the_geom);

        EXECUTE 'CREATE TABLE st_vert_tmp (gid integer, vid integer, wend char(1))';

        FOR points IN EXECUTE 'SELECT ' || quote_ident(gid_cname) || ' AS id,'
                || ' PointN('|| quote_ident(geo_cname) ||', 1) AS source,'
                || ' PointN('|| quote_ident(geo_cname) ||', NumPoints('
                || quote_ident(geo_cname) ||')) AS target'
                || ' FROM ' || quote_ident(geom_table) 
                || where_clause
                || ' ORDER BY ' || quote_ident(gid_cname)
            loop

                IF points.id%1000=0 THEN
                      RAISE NOTICE '% out of % edges processed', points.id, countids;
                END IF;

                source_id := imt_intersection_point_to_id(setsrid(points.source, srid), tolerance);
                target_id := imt_intersection_point_to_id(setsrid(points.target, srid), tolerance);

                INSERT INTO st_vert_tmp values(points.id, source_id, 'S');
                INSERT INTO st_vert_tmp values(points.id, target_id, 'T');

        END LOOP;


        create index st_vert_tmp_vid_idx on st_vert_tmp using btree (vid);
        create index st_vert_tmp_gid_idx on st_vert_tmp using btree (gid);
        CREATE INDEX intersections_tmp_id_idx ON intersections_tmp USING btree (id ASC NULLS LAST);
        CREATE INDEX intersections_tmp_dcnt_idx ON intersections_tmp USING btree (dcnt ASC NULLS LAST);
        DROP INDEX IF EXISTS streets_gid_idx;
        CREATE INDEX streets_gid_idx ON streets USING btree (gid ASC NULLS LAST);
/*
        update intersections_tmp as a set
          cnt  = (select count(*) from st_vert_tmp b where b.vid=a.id),
          dcnt = (select count(distinct name) from st_vert_tmp b, streets c where b.gid=c.gid and b.vid=a.id and c.name is not null);
*/
    RETURN 'OK';

/*
    -- The following are various uses of these tables

    -- get a count of intersections with multiple street names
    select count(*) from intersections_tmp where dcnt>1;

    -- see a sample of the intersections and the street names
    select distinct a.id, c.name
      from intersections_tmp a, st_vert_tmp b, streets c
     where a.id=b.vid and b.gid=c.gid and a.dcnt>1 and c.name is not null
     order by a.id, c.name
     limit 100;

    -- find the nearest intersection to a point
     select a.id, round(distance_sphere(setsrid(makepoint(-90.51791, 14.61327), 4326), a.the_geom)::numeric,1) as dist, list(c.name),
            c.r_ac5, c.r_ac4, c.r_ac3, c.r_ac2, c.r_ac1
      from intersections_tmp a, st_vert_tmp b, streets c
     where a.id=b.vid and b.gid=c.gid and a.dcnt>1 and c.name is not null
       and expand(setsrid(makepoint(-90.51791, 14.61327), 4326), 0.0013) && a.the_geom
     group by a.id, dist, c.r_ac5, c.r_ac4, c.r_ac3, c.r_ac2, c.r_ac1
     order by dist, a.id;


*/

END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100;
ALTER FUNCTION imt_make_intersections(character varying, double precision, character varying, character varying, text) OWNER TO postgres;

DROP TYPE IF EXISTS rgeo_result_flds CASCADE;
CREATE TYPE rgeo_result_flds AS
    (address text,
     village text,
     city    text,
     county  text,
     state   text,
     country text,
     postcode text,
     distance float,
     linkid int);

DROP TYPE IF EXISTS  rgeo_result CASCADE;
CREATE TYPE rgeo_result AS
    (address text,
     distance float,
     linkid int);


-- Function: imt_reverse_geocode_flds(geometry)

-- DROP FUNCTION imt_reverse_geocode_flds(geometry);

CREATE OR REPLACE FUNCTION imt_rgeo_intersections_flds(geometry)
  RETURNS rgeo_result_flds AS
$BODY$
/*
 * ROW(street & street, village, city, county, state, country, postcode, distance_meters, id) = rgeo(point);
 * ROW(street & street, village, city, county, state, country, postcode, distance_meters, id) = rgeo(long, lat);
 * 
 * This function performs reverse geocoding on that iMaptools intersection table
 * data. It returns a rgeo_result record for the closest intersection(s), or
 * NULL if it fails.
 *
 * We are ignoring the fact the degrees longitude are shortened as we
 * move toword the poles.
 *
 * Algorithm:
 * We create a small radius (0.0013 degrees, .0897 miles) and search
 * for the closest segment within that radius and compute the results.
 * If we fail to find any results in that radius we double it and search
 * again until we exceed a one degree radius which is roughtly 69*69 sq-miles.
 *
 */

DECLARE
    pnt ALIAS FOR $1;
    pnt2 GEOMETRY;
    radius FLOAT;
    address TEXT;
    location TEXT;
    mdistance FLOAT;
    rr RECORD;
    pct FLOAT;
    right BOOLEAN;
    ret rgeo_result_flds;

BEGIN
    IF GeometryType(pnt) != 'POINT' THEN
        RETURN NULL;
    END IF;

    radius := 0.0013;
    LOOP
       select into rr a.id, round(distance_sphere(pnt, a.the_geom)::numeric,1) as dist, list(c.name) as name,
              c.r_ac5, c.r_ac4, c.r_ac3, c.r_ac2, c.r_ac1, c.r_postcode
         from intersections_tmp a, st_vert_tmp b, streets c
        where a.id=b.vid and b.gid=c.gid and a.dcnt>1 and c.name is not null
              and expand(pnt, radius) && a.the_geom
        group by a.id, dist, c.r_ac5, c.r_ac4, c.r_ac3, c.r_ac2, c.r_ac1, c.r_postcode
        order by dist, a.id limit 1;
        IF FOUND THEN
--raise notice 'rr: %', rr;

            ret.village  := rr.r_ac5;
            ret.city     := rr.r_ac4;
            ret.county   := rr.r_ac3;
            ret.state    := rr.r_ac2;
            ret.country  := rr.r_ac1;
            ret.postcode := rr.r_postcode;
            ret.address  := rr.name;
            ret.distance := rr.dist;
            ret.linkid := rr.id;
            RETURN ret;
        END IF;
        radius := radius * 2.0;
        IF radius > 0.5 THEN
            RETURN NULL;
        END IF;
    END LOOP;
END
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;
ALTER FUNCTION imt_rgeo_intersections_flds(geometry) OWNER TO postgres;

-- Function: imt_rgeo_intersections_flds(double precision, double precision)

-- DROP FUNCTION imt_rgeo_intersections_flds(double precision, double precision);

CREATE OR REPLACE FUNCTION imt_rgeo_intersections_flds(double precision, double precision)
  RETURNS rgeo_result_flds AS
$BODY$

DECLARE
    x ALIAS FOR $1;
    y ALIAS FOR $2;
    rrow RECORD;

BEGIN
    rrow = imt_rgeo_intersections_flds(SetSRID(MakePoint(x, y), 4326));
    return rrow;
END;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;
ALTER FUNCTION imt_rgeo_intersections_flds(double precision, double precision) OWNER TO postgres;


-- Function: imt_rgeo_intersections(double precision, double precision)

-- DROP FUNCTION imt_rgeo_intersections(double precision, double precision);

CREATE OR REPLACE FUNCTION imt_rgeo_intersections(double precision, double precision)
  RETURNS rgeo_result AS
$BODY$

DECLARE
    x ALIAS FOR $1;
    y ALIAS FOR $2;
    rrow rgeo_result;

BEGIN
    select into rrow address||':'||array_to_string(ARRAY[village,city,county,state,country,postcode], ', '), distance, linkid
 from imt_rgeo_intersections_flds(x, y);
    return rrow;
END;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;
ALTER FUNCTION imt_rgeo_intersections(double precision, double precision) OWNER TO postgres;


-- Function: imt_rgeo_intersections(geometry)

-- DROP FUNCTION imt_rgeo_intersections(geometry);

CREATE OR REPLACE FUNCTION imt_rgeo_intersections(geometry)
  RETURNS rgeo_result AS
$BODY$

DECLARE
    g ALIAS FOR $1;
    rrow rgeo_result;

BEGIN
    select into rrow address||':'||array_to_string(ARRAY[village,city,county,state,country,postcode], ', '), distance, linkid
 from imt_rgeo_intersections_flds(g);
    return rrow;
END;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;
ALTER FUNCTION imt_rgeo_intersections(geometry) OWNER TO postgres;


-- Function: imt_reverse_geocode_flds(geometry)

-- DROP FUNCTION imt_reverse_geocode_flds(geometry);

CREATE OR REPLACE FUNCTION imt_reverse_geocode_flds(geometry)
  RETURNS rgeo_result_flds AS
$BODY$
/*
 * ROW(address, village, city, county, state, country, postcode, distance_meters, linkid) = rgeo(point);
 * ROW(address, village, city, county, state, country, postcode, distance_meters, linkid) = rgeo(long, lat);
 * 
 * This function performs reverse geocoding on that iMaptools Navteq
 * data. It returns a rgeo_result record for the closest segment, or
 * NULL if it fails.
 *
 * We are ignoring the fact the degrees longitude are shortened as we
 * move toword the poles.
 *
 * Algorithm:
 * We create a small radius (0.0013 degrees, .0897 miles) and search
 * for the closest segment within that radius and compute the results.
 * If we fail to find any results in that radius we double it and search
 * again until we exceed a one degree radius which is roughtly 69*69 sq-miles.
 *
 */

DECLARE
    pnt ALIAS FOR $1;
    pnt2 GEOMETRY;
    radius FLOAT;
    address TEXT;
    location TEXT;
    mdistance FLOAT;
    rr RECORD;
    pct FLOAT;
    right BOOLEAN;
    ret rgeo_result_flds;

BEGIN
    IF GeometryType(pnt) != 'POINT' THEN
        RETURN NULL;
    END IF;

    radius := 0.0013;
    LOOP
        SELECT * INTO rr FROM data.streets
            WHERE expand(pnt, radius) && the_geom
            ORDER BY distance(pnt, the_geom) ASC limit 1;
        IF FOUND THEN
--raise notice 'rr: %', rr;
            IF GeometryType(rr.the_geom)='MULTILINESTRING' THEN
                rr.the_geom := GeometryN(rr.the_geom, 1);
            END IF;
            pct := line_locate_point(rr.the_geom, pnt);
            pnt2 := line_interpolate_point(rr.the_geom, pct);
            mdistance := distance_sphere(pnt, pnt2);

            /*
             * we will arbitrarily assume the right side of the street
             * unless it has no address ranges, then the left else we
             * only return the street name if it exits.
             */
--raise notice '%, if % and % elsif % and %', rr.link_id, rr.l_refaddr IS NOT NULL, rr.l_sqlfmt IS NOT NULL, rr.r_refaddr IS NOT NULL, rr.r_sqlfmt IS NOT NULL;
            IF rr.l_refaddr IS NOT NULL AND rr.l_sqlfmt IS NOT NULL THEN
                /* linear interpolate the house number based on the pct */
--RAISE NOTICE 'LEFT: %, %, %', pct, TO_CHAR((rr.l_nrefaddr-rr.l_refaddr)*pct + rr.l_refaddr, rr.l_sqlnumf), (rr.l_nrefaddr-rr.l_refaddr)*pct + rr.l_refaddr;
                address := REPLACE(rr.l_sqlfmt, '{}',
                    TO_CHAR((rr.l_nrefaddr-rr.l_refaddr)*pct + rr.l_refaddr,
                        rr.l_sqlnumf)) || ' ';
                right := false;
            ELSIF rr.r_refaddr IS NOT NULL AND rr.r_sqlfmt IS NOT NULL THEN
--RAISE NOTICE 'RIGHT: %, %', pct, TO_CHAR((rr.r_nrefaddr-rr.r_refaddr)*pct + rr.r_refaddr, rr.r_sqlnumf);
                /* linear interpolate the house number based on the pct */
                address := REPLACE(rr.r_sqlfmt, '{}',
                    TO_CHAR((rr.r_nrefaddr-rr.r_refaddr)*pct + rr.r_refaddr,
                        rr.r_sqlnumf)) || ' ';
                right := true;
            ELSE
                /* no house numbers, we might still have a street name */
                right := NULL;
            END IF;
            address := coalesce(address, '');
            
            /* get the street name */
            IF rr.name IS NOT NULL THEN
                --address := address || rr.name || ', ';
                address := address || rr.name;
            ELSE
                address := '';
            END IF;
            ret.address := address;

            if (address='') and exists(SELECT * FROM pg_catalog.pg_tables WHERE tablename='intersections_tmp') then
                select into rr * from imt_rgeo_intersections_flds(pnt);
                return rr;
            end if;

            
--RAISE NOTICE 'RIGHT: %, address: %', right, address;
            /* get the city, state, country postcode*/
            location := '';
            IF right IS NULL OR right THEN
                location := COALESCE(NULLIF(rr.r_ac5, ''), NULLIF(rr.r_ac4, ''),
                  NULLIF(rr.r_ac3, '')) || ', ' || rr.r_ac2 || ', ' || rr.r_ac1
                  || COALESCE(NULLIF(', ' || rr.r_postcode, ', '), '');
                  ret.village := rr.r_ac5;
                  ret.city    := rr.r_ac4;
                  ret.county  := rr.r_ac3;
                  ret.state   := rr.r_ac2;
                  ret.country := rr.r_ac1;
                  ret.postcode := rr.r_postcode;
            END IF;
            
            IF (right IS NULL AND LENGTH(address)=0) OR NOT right THEN
                location := COALESCE(NULLIF(rr.l_ac5, ''), NULLIF(rr.l_ac4, ''),
                  NULLIF(rr.l_ac3, '')) || ', ' || rr.l_ac2 || ', ' || rr.l_ac1
                  || COALESCE(NULLIF(', ' || rr.l_postcode, ', '), '');
                  ret.village := rr.l_ac5;
                  ret.city    := rr.l_ac4;
                  ret.county  := rr.l_ac3;
                  ret.state   := rr.l_ac2;
                  ret.country := rr.l_ac1;
                  ret.postcode := rr.l_postcode;
            END IF;
            
            IF LENGTH(location)=0 THEN
            --raise notice 'no location: %', rr.link_id;
                RETURN NULL;
            ELSE
                --ret := ROW(address||location, mdistance, rr.link_id);
                ret.distance := mdistance;
                ret.linkid := rr.link_id;
                RETURN ret;
            END IF;
        END IF;
        radius := radius * 2.0;
        IF radius > 0.5 THEN
            RETURN NULL;
        END IF;
    END LOOP;
END
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;
ALTER FUNCTION imt_reverse_geocode_flds(geometry) OWNER TO postgres;

-- Function: imt_reverse_geocode_flds(double precision, double precision)

-- DROP FUNCTION imt_reverse_geocode_flds(double precision, double precision);

CREATE OR REPLACE FUNCTION imt_reverse_geocode_flds(double precision, double precision)
  RETURNS rgeo_result_flds AS
$BODY$

DECLARE
    x ALIAS FOR $1;
    y ALIAS FOR $2;
    rrow RECORD;

BEGIN
    rrow = imt_reverse_geocode_flds(SetSRID(MakePoint(x, y), 4326));
    return rrow;
END;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;
ALTER FUNCTION imt_reverse_geocode_flds(double precision, double precision) OWNER TO postgres;


-- Function: imt_reverse_geocode(double precision, double precision)

-- DROP FUNCTION imt_reverse_geocode(double precision, double precision);

CREATE OR REPLACE FUNCTION imt_reverse_geocode(double precision, double precision)
  RETURNS rgeo_result AS
$BODY$

DECLARE
    x ALIAS FOR $1;
    y ALIAS FOR $2;
    rrow RECORD;

BEGIN
    select into rrow address||':'||array_to_string(ARRAY[village,city,county,state,country,postcode], ', '), distance, linkid
 from imt_reverse_geocode_flds(SetSRID(MakePoint(x, y), 4326));
    return rrow;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION imt_reverse_geocode(double precision, double precision) OWNER TO postgres;

-- Function: imt_reverse_geocode(geometry)

-- DROP FUNCTION imt_reverse_geocode(geometry);

CREATE OR REPLACE FUNCTION imt_reverse_geocode(geometry)
  RETURNS rgeo_result AS
$BODY$

DECLARE
    g ALIAS FOR $1;
    rrow RECORD;

BEGIN
    select into rrow address||':'||array_to_string(ARRAY[village,city,county,state,country,postcode], ', '), distance, linkid
 from imt_reverse_geocode_flds(g);
    return rrow;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION imt_reverse_geocode(geometry) OWNER TO postgres;

select populate_geometry_columns();
SELECT srid FROM geometry_columns WHERE f_table_name='streets';

select imt_make_intersections('streets', 0.000001, 'the_geom', 'gid', ' where name is not null ');
-- Total query runtime: 2550136 ms.

update intersections_tmp as a set
          cnt  = (select count(*) from st_vert_tmp b where b.vid=a.id),
          dcnt = (select count(distinct name) from st_vert_tmp b, streets c where b.gid=c.gid and b.vid=a.id and c.name is not null);
-- Query returned successfully: 3517821 rows affected, 646920 ms execution time.

select * from imt_reverse_geocode_flds(-75.5,45.0);
-- 

select * from imt_rgeo_intersections_flds(-75.5,45.0);
-- 


/*
create schema rawdata;
--alter table addrange set schema rawdata;
--alter table altnamlink set schema rawdata;
--alter table blkpassage set schema rawdata;
alter table ferryseg set schema rawdata;
--alter table junction set schema rawdata;
alter table link_id set schema rawdata;
alter table roadseg set schema rawdata;
--alter table strplaname set schema rawdata;
--alter table tollpoint set schema rawdata;

alter function imt_make_intersections(character varying, double precision, character varying, character varying) set schema rawdata;
alter function imt_make_intersections(character varying, double precision, character varying, character varying, text) set schema rawdata;
*/