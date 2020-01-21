drop table if exists gaz cascade;
create table gaz (
    id serial not null primary key,
    seq integer,
    word text,
    stdword text,
    token integer
);
COPY gaz (id, seq, word, stdword, token) FROM stdin;
1	1	AB	ALBERTA	11
2	2	AB	ALBERTA	1
3	3	AB	ALBERTA	6
4	1	AFB	AIR FORCE BASE	1
5	1	A F B	AIR FORCE BASE	1
6	1	AIR FORCE BASE	AIR FORCE BASE	1
7	1	AK	ALASKA	11
8	2	AK	ALASKA	1
9	3	AK	ALASKA	6
10	1	AL	ALABAMA	11
11	2	AL	ALABAMA	1
12	3	AL	ALABAMA	6
13	1	ALA	ALABAMA	11
14	2	ALA	ALABAMA	1
15	3	ALA	ALABAMA	6
16	1	ALABAMA	ALABAMA	11
17	2	ALABAMA	ALABAMA	1
18	1	ALASKA	ALASKA	11
19	2	ALASKA	ALASKA	1
20	1	ALBERTA	ALBERTA	11
21	2	ALBERTA	ALBERTA	1
22	1	AR	ARKANSAS	11
23	2	AR	ARKANSAS	1
24	3	AR	ARKANSAS	6
25	1	ARIZ	ARIZONA	11
26	2	ARIZ	ARIZONA	1
27	3	ARIZ	ARIZONA	6
28	1	ARIZONA	ARIZONA	11
29	2	ARIZONA	ARIZONA	1
30	1	ARK	ARKANSAS	11
31	2	ARK	ARKANSAS	1
32	3	ARK	ARKANSAS	6
33	1	ARKANSAS	ARKANSAS	11
34	2	ARKANSAS	ARKANSAS	1
35	1	AZ	ARIZONA	11
36	2	AZ	ARIZONA	1
37	3	AZ	ARIZONA	6
38	1	B C	BRITISH COLUMBIA	11
39	2	B C	BRITISH COLUMBIA	1
40	3	B C	BRITISH COLUMBIA	6
41	1	BC	BRITISH COLUMBIA	11
42	2	BC	BRITISH COLUMBIA	1
43	3	BC	BRITISH COLUMBIA	6
44	1	BRITISH COLUMBIA	BRITISH COLUMBIA	11
45	2	BRITISH COLUMBIA	BRITISH COLUMBIA	1
46	1	CA	CALIFORNIA	11
47	2	CA	CALIFORNIA	1
48	3	CA	CALIFORNIA	6
49	4	CA	CANADA	12
50	5	CA	CARRE	2
51	1	CALIF	CALIFORNIA	11
52	2	CALIF	CALIFORNIA	1
53	3	CALIF	CALIFORNIA	6
54	1	CALIFORNIA	CALIFORNIA	11
55	2	CALIFORNIA	CALIFORNIA	1
56	1	CANADA	CANADA	12
57	2	CANADA	CANADA	1
58	1	CO	COLORADO	11
59	2	CO	COLORADO	1
60	3	CO	COLORADO	6
61	1	COLOMBIE BRITANNIQUE	BRITISH COLUMBIA	11
62	2	COLOMBIE BRITANNIQUE	BRITISH COLUMBIA	1
63	1	COLORADO	COLORADO	11
64	2	COLORADO	COLORADO	1
65	1	CONN	CONNECTICUT	11
66	2	CONN	CONNECTICUT	1
67	3	CONN	CONNECTICUT	6
68	1	CONNECTICUT	CONNECTICUT	11
69	2	CONNECTICUT	CONNECTICUT	1
70	1	CT	CONNECTICUT	11
71	2	CT	CONNECTICUT	1
72	3	CT	CONNECTICUT	6
73	1	DC	DISTRICT OF COLUMBIA	11
74	2	DC	DISTRICT OF COLUMBIA	1
75	3	DC	DISTRICT OF COLUMBIA	6
76	1	DE	DELAWARE	11
77	3	DE	DELAWARE	1
78	1	DEL	DELAWARE	11
79	2	DEL	DELAWARE	1
80	3	DEL	DELAWARE	6
81	1	DELAWARE	DELAWARE	11
82	2	DELAWARE	DELAWARE	1
83	1	DISTRICT OF COLUMBIA	DISTRICT OF COLUMBIA	11
84	2	DISTRICT OF COLUMBIA	DISTRICT OF COLUMBIA	1
85	1	FL	FLORIDA	11
86	2	FL	FLORIDA	1
87	3	FL	FLORIDA	6
88	1	FLA	FLORIDA	11
89	2	FLA	FLORIDA	1
90	3	FLA	FLORIDA	6
91	1	FLORIDA	FLORIDA	11
92	2	FLORIDA	FLORIDA	1
93	1	FRKS	FORKS	1
94	1	GA	GEORGIA	11
95	2	GA	GEORGIA	1
96	3	GA	GEORGIA	6
97	1	GEORGIA	GEORGIA	11
98	2	GEORGIA	GEORGIA	1
99	1	HAWAII	HAWAII	11
100	2	HAWAII	HAWAII	1
101	1	HI	HAWAII	11
102	2	HI	HAWAII	1
103	3	HI	HAWAII	6
104	1	IA	IOWA	11
105	2	IA	IOWA	1
106	3	IA	IOWA	6
107	1	ID	IDAHO	11
108	2	ID	IDAHO	1
109	3	ID	IDAHO	6
110	1	IDAHO	IDAHO	11
111	2	IDAHO	IDAHO	1
112	1	IL	ILLINOIS	11
113	2	IL	ILLINOIS	1
114	3	IL	ILLINOIS	6
115	1	ILE DU PRINCE EDOUARD	PRINCE EDWARD ISLAND	11
116	2	ILE DU PRINCE EDOUARD	PRINCE EDWARD ISLAND	1
117	1	ILL	ILLINOIS	11
118	2	ILL	ILLINOIS	1
119	3	ILL	ILLINOIS	6
120	1	ILLINOIS	ILLINOIS	11
121	2	ILLINOIS	ILLINOIS	1
122	1	IN	INDIANA	11
123	2	IN	INDIANA	1
124	3	IN	INDIANA	6
125	1	IND	INDIANA	11
126	2	IND	INDIANA	1
127	2	IND	INDIANA	6
128	1	INDIANA	INDIANA	11
129	2	INDIANA	INDIANA	1
130	1	IOWA	IOWA	11
131	2	IOWA	IOWA	1
132	1	KANSAS	KANSAS	11
133	2	KANSAS	KANSAS	1
134	1	KENT	KENTUCKY	11
135	2	KENT	KENTUCKY	1
136	3	KENT	KENTUCKY	6
137	1	KENTUCKY	KENTUCKY	11
138	2	KENTUCKY	KENTUCKY	1
139	1	KS	KANSAS	11
140	2	KS	KANSAS	1
141	3	KS	KANSAS	6
142	1	KY	KENTUCKY	11
143	2	KY	KENTUCKY	1
144	3	KY	KENTUCKY	6
145	1	LA	LOUISIANA	11
146	2	LA	LOUISIANA	1
147	3	LA	LOUISIANA	6
148	1	LABRADOR	NEWFOUNDLAND AND LABRADOR	11
149	2	LABRADOR	NEWFOUNDLAND AND LABRADOR	1
150	1	LOUISIANA	LOUISIANA	11
151	2	LOUISIANA	LOUISIANA	1
152	1	MA	MASSACHUSETTS	11
153	2	MA	MASSACHUSETTS	1
154	3	MA	MASSACHUSETTS	6
155	4	MA	MANOR	2
156	1	MAINE	MAINE	11
157	2	MAINE	MAINE	1
158	1	MANITOBA	MANITOBA	11
159	2	MANITOBA	MANITOBA	1
160	1	MARYLAND	MARYLAND	11
161	2	MARYLAND	MARYLAND	1
162	1	MASS	MASSACHUSETTS	11
163	2	MASS	MASSACHUSETTS	1
164	3	MASS	MASSACHUSETTS	6
165	1	MASSACHUSETTS	MASSACHUSETTS	11
166	2	MASSACHUSETTS	MASSACHUSETTS	1
167	1	MB	MANITOBA	11
168	2	MB	MANITOBA	1
169	3	MB	MANITOBA	6
170	1	MD	MARYLAND	11
171	2	MD	MARYLAND	1
172	3	MD	MARYLAND	6
173	1	ME	MAINE	11
174	2	ME	MAINE	1
175	3	ME	MAINE	6
176	1	MI	MICHIGAN	11
177	2	MI	MICHIGAN	1
178	3	MI	MICHIGAN	6
179	1	MICH	MICHIGAN	11
180	2	MICH	MICHIGAN	1
181	3	MICH	MICHIGAN	6
182	1	MICHIGAN	MICHIGAN	11
183	2	MICHIGAN	MICHIGAN	1
184	1	MINN	MINNESOTA	11
185	2	MINN	MINNESOTA	1
186	3	MINN	MINNESOTA	6
187	1	MINNESOTA	MINNESOTA	11
188	2	MINNESOTA	MINNESOTA	1
189	1	MISSISSIPPI	MISSISSIPPI	11
190	2	MISSISSIPPI	MISSISSIPPI	1
191	1	MISSOURI	MISSOURI	11
192	2	MISSOURI	MISSOURI	1
193	1	MN	MINNESOTA	11
194	2	MN	MINNESOTA	1
195	3	MN	MINNESOTA	6
196	1	MO	MISSOURI	11
197	2	MO	MISSOURI	1
198	3	MO	MISSOURI	6
199	1	MONT	MONTANA	11
200	2	MONT	MONTANA	1
201	3	MONT	MONTANA	6
202	1	MONTANA	MONTANA	11
203	2	MONTANA	MONTANA	1
204	1	MT	MONTANA	11
205	2	MT	MONTANA	1
206	3	MT	MONTANA	6
207	1	MS	MISSISSIPPI	11
208	2	MS	MISSISSIPPI	1
209	3	MS	MISSISSIPPI	6
210	1	N CAROLINA	NORTH CAROLINA	11
211	2	N CAROLINA	NORTH CAROLINA	1
212	1	N DAKOTA	NORTH DAKOTA	11
213	2	N DAKOTA	NORTH DAKOTA	1
214	1	NB	NEW BRUNSWICK	11
215	2	NB	NEW BRUNSWICK	1
216	3	NB	NEW BRUNSWICK	6
217	1	NC	NORTH CAROLINA	11
218	2	NC	NORTH CAROLINA	1
219	3	NC	NORTH CAROLINA	6
220	1	ND	NORTH DAKOTA	11
221	2	ND	NORTH DAKOTA	1
222	3	ND	NORTH DAKOTA	6
223	1	NE	NEBRASKA	11
224	2	NE	NEBRASKA	1
225	3	NE	NEBRASKA	6
226	1	NEB	NEBRASKA	11
227	2	NEB	NEBRASKA	1
228	3	NEB	NEBRASKA	6
229	1	NEBRASKA	NEBRASKA	11
230	2	NEBRASKA	NEBRASKA	1
231	1	NEV	NEVADA	11
232	2	NEV	NEVADA	1
233	3	NEV	NEVADA	6
234	1	NEVADA	NEVADA	11
235	2	NEVADA	NEVADA	1
236	1	NEW BRUNSWICK	NEW BRUNSWICK	11
237	2	NEW BRUNSWICK	NEW BRUNSWICK	1
238	1	NEW HAMPSHIRE	NEW HAMPSHIRE	11
239	2	NEW HAMPSHIRE	NEW HAMPSHIRE	1
240	1	NEW JERSEY	NEW JERSEY	11
241	2	NEW JERSEY	NEW JERSEY	1
242	1	NEW MEXICO	NEW MEXICO	11
243	2	NEW MEXICO	NEW MEXICO	1
244	1	NEW YORK	NEW YORK	11
245	2	NEW YORK	NEW YORK	1
246	1	NEWFOUNDLAND	NEWFOUNDLAND AND LABRADOR	11
247	2	NEWFOUNDLAND	NEWFOUNDLAND AND LABRADOR	1
248	1	NF	NEWFOUNDLAND AND LABRADOR	11
249	2	NF	NEWFOUNDLAND AND LABRADOR	1
250	3	NF	NEWFOUNDLAND AND LABRADOR	6
251	1	NH	NEW HAMPSHIRE	11
252	2	NH	NEW HAMPSHIRE	1
253	3	NH	NEW HAMPSHIRE	6
254	1	NJ	NEW JERSEY	11
255	2	NJ	NEW JERSEY	1
256	3	NJ	NEW JERSEY	6
257	1	NL	NEWFOUNDLAND AND LABRADOR	11
258	2	NL	NEWFOUNDLAND AND LABRADOR	1
259	3	NL	NEWFOUNDLAND AND LABRADOR	6
260	1	NM	NEW MEXICO	11
261	2	NM	NEW MEXICO	1
262	3	NM	NEW MEXICO	6
263	1	NORTH CAROLINA	NORTH CAROLINA	11
264	2	NORTH CAROLINA	NORTH CAROLINA	1
265	1	NORTH DAKOTA	NORTH DAKOTA	11
266	2	NORTH DAKOTA	NORTH DAKOTA	1
267	1	NORTHWEST	NORTHWEST	22
268	1	NORTHWEST TERRITORIES	NORTHWEST TERRITORIES	11
269	2	NORTHWEST TERRITORIES	NORTHWEST TERRITORIES	1
270	1	NOUVEAU BRUNSWICK	NEW BRUNSWICK	11
271	2	NOUVEAU BRUNSWICK	NEW BRUNSWICK	1
272	1	NOUVELLE ECOSSE	NOVA SCOTIA	11
273	2	NOUVELLE ECOSSE	NOVA SCOTIA	1
274	1	NOVA SCOTIA	NOVA SCOTIA	11
275	2	NOVA SCOTIA	NOVA SCOTIA	1
276	1	NS	NOVA SCOTIA	11
277	2	NS	NOVA SCOTIA	1
278	3	NS	NOVA SCOTIA	6
279	1	NT	NORTHWEST TERRITORIES	11
280	2	NT	NORTHWEST TERRITORIES	1
281	3	NT	NORTHWEST TERRITORIES	6
282	1	NU	NUNAVUT	11
283	2	NU	NUNAVUT	1
284	3	NU	NUNAVUT	6
285	1	NUNAVUT	NUNAVUT	11
286	2	NUNAVUT	NUNAVUT	1
287	1	NV	NEVADA	11
288	2	NV	NEVADA	1
289	3	NV	NEVADA	6
290	1	NY	NEW YORK	11
291	2	NY	NEW YORK	1
292	3	NY	NEW YORK	6
293	1	OH	OHIO	11
294	2	OH	OHIO	1
295	3	OH	OHIO	6
296	1	OHIO	OHIO	11
297	2	OHIO	OHIO	1
298	1	OK	OKLAHOMA	11
299	2	OK	OKLAHOMA	1
300	3	OK	OKLAHOMA	6
301	1	OKLA	OKLAHOMA	11
302	2	OKLA	OKLAHOMA	1
303	3	OKLA	OKLAHOMA	6
304	1	OKLAHOMA	OKLAHOMA	11
305	2	OKLAHOMA	OKLAHOMA	1
306	1	ON	ONTARIO	11
307	2	ON	ONTARIO	1
308	3	ON	ONTARIO	6
309	1	ONT	ONTARIO	11
310	2	ONT	ONTARIO	1
311	3	ONT	ONTARIO	6
312	1	ONTARIO	ONTARIO	11
313	2	ONTARIO	ONTARIO	1
314	1	OR	OREGON	11
315	2	OR	OREGON	1
316	3	OR	OREGON	6
317	1	ORE	OREGON	11
318	2	ORE	OREGON	1
319	3	ORE	OREGON	6
320	1	OREGON	OREGON	11
321	2	OREGON	OREGON	1
322	1	PA	PENNSYLVANIA	11
323	2	PA	PENNSYLVANIA	1
324	3	PA	PENNSYLVANIA	6
325	1	PE	PRINCE EDWARD ISLAND	11
326	2	PE	PRINCE EDWARD ISLAND	1
327	3	PE	PRINCE EDWARD ISLAND	6
328	1	PEI	PRINCE EDWARD ISLAND	11
329	2	PEI	PRINCE EDWARD ISLAND	1
330	3	PEI	PRINCE EDWARD ISLAND	6
331	1	PENN	PENNSYLVANIA	11
332	2	PENN	PENNSYLVANIA	1
333	3	PENN	PENNSYLVANIA	6
334	1	PENNA	PENNSYLVANIA	11
335	2	PENNA	PENNSYLVANIA	1
336	3	PENNA	PENNSYLVANIA	6
337	1	PENNSYLVANIA	PENNSYLVANIA	11
338	2	PENNSYLVANIA	PENNSYLVANIA	1
339	1	PQ	QUEBEC	11
340	2	PQ	QUEBEC	1
341	3	PQ	QUEBEC	6
342	1	PR	PUERTO RICO	11
343	2	PR	PUERTO RICO	1
344	3	PR	PUERTO RICO	6
345	1	PRINCE EDWARD ISLAND	PRINCE EDWARD ISLAND	11
346	2	PRINCE EDWARD ISLAND	PRINCE EDWARD ISLAND	1
347	1	PUERTO RICO	PUERTO RICO	11
348	2	PUERTO RICO	PUERTO RICO	1
349	1	QC	QUEBEC	11
350	2	QC	QUEBEC	1
351	3	QC	QUEBEC	6
352	1	QUEBEC	QUEBEC	11
353	2	QUEBEC	QUEBEC	1
354	1	RHODE ISLAND	RHODE ISLAND	11
355	2	RHODE ISLAND	RHODE ISLAND	1
356	1	RI	RHODE ISLAND	11
357	2	RI	RHODE ISLAND	1
358	3	RI	RHODE ISLAND	6
359	1	S CAROLINA	SOUTH CAROLINA	11
360	2	S CAROLINA	SOUTH CAROLINA	1
361	1	S DAKOTA	SOUTH DAKOTA	11
362	2	S DAKOTA	SOUTH DAKOTA	1
363	1	SASK	SASKATCHEWAN	11
364	2	SASK	SASKATCHEWAN	1
365	1	SASKATCHEWAN	SASKATCHEWAN	11
366	2	SASKATCHEWAN	SASKATCHEWAN	1
367	1	SC	SOUTH CAROLINA	11
368	2	SC	SOUTH CAROLINA	1
369	3	SC	SOUTH CAROLINA	6
370	1	SD	SOUTH DAKOTA	11
371	2	SD	SOUTH DAKOTA	1
372	3	SD	SOUTH DAKOTA	6
373	1	SK	SASKATCHEWAN	11
374	2	SK	SASKATCHEWAN	1
375	3	SK	SASKATCHEWAN	6
376	1	SOUTH CAROLINA	SOUTH CAROLINA	11
377	2	SOUTH CAROLINA	SOUTH CAROLINA	1
378	1	SOUTH DAKOTA	SOUTH DAKOTA	11
379	2	SOUTH DAKOTA	SOUTH DAKOTA	1
380	1	TENN	TENNESSEE	11
381	2	TENN	TENNESSEE	1
382	3	TENN	TENNESSEE	6
383	1	TENNESSEE	TENNESSEE	11
384	2	TENNESSEE	TENNESSEE	1
385	1	TERRE NEUVE	NEWFOUNDLAND	11
386	2	TERRE NEUVE	NEWFOUNDLAND	1
387	1	TERRITOIRES DU NORD OUES	NORTHWEST TERRITORIES	11
388	2	TERRITOIRES DU NORD OUES	NORTHWEST TERRITORIES	1
389	1	TEX	TEXAS	11
390	2	TEX	TEXAS	1
391	3	TEX	TEXAS	6
392	1	TEXAS	TEXAS	11
393	2	TEXAS	TEXAS	1
394	1	TN	TENNESSEE	11
395	2	TN	TENNESSEE	1
396	3	TN	TENNESSEE	6
397	1	TX	TEXAS	11
398	2	TX	TEXAS	1
399	3	TX	TEXAS	6
400	2	U S	US	1
401	3	U S	USA	12
402	1	U S A	USA	12
403	1	UNITED STATES OF AMERICA	USA	12
404	2	US	US	1
405	3	US	USA	12
406	1	USA	USA	12
407	1	UT	UTAH	11
408	2	UT	UTAH	1
409	3	UT	UTAH	6
410	1	UTAH	UTAH	11
411	2	UTAH	UTAH	1
412	1	VA	VIRGINIA	11
413	2	VA	VIRGINIA	1
414	3	VA	VIRGINIA	6
415	1	VERMONT	VERMONT	11
416	2	VERMONT	VERMONT	1
417	1	VIRGINIA	VIRGINIA	11
418	2	VIRGINIA	VIRGINIA	1
419	1	VT	VERMONT	11
420	2	VT	VERMONT	1
421	3	VT	VERMONT	6
422	1	W VIRGINIA	WEST VIRGINIA	11
423	2	W VIRGINIA	WEST VIRGINIA	1
424	1	WA	WASHINGTON	11
425	2	WA	WASHINGTON	1
426	3	WA	WASHINGTON	6
427	1	WASH	WASHINGTON	11
428	2	WASH	WASHINGTON	1
429	3	WASH	WASHINGTON	6
430	1	WASHINGTON	WASHINGTON	11
431	2	WASHINGTON	WASHINGTON	1
432	1	WEST VIRGINIA	WEST VIRGINIA	11
433	2	WEST VIRGINIA	WEST VIRGINIA	1
434	1	WI	WISCONSIN	11
435	2	WI	WISCONSIN	1
436	3	WI	WISCONSIN	6
437	1	WISC	WISCONSIN	11
438	2	WISC	WISCONSIN	1
439	3	WISC	WISCONSIN	6
440	1	WISCONSIN	WISCONSIN	11
441	2	WISCONSIN	WISCONSIN	1
442	1	WV	WEST VIRGINIA	11
443	2	WV	WEST VIRGINIA	1
444	3	WV	WEST VIRGINIA	6
445	1	WY	WYOMING	11
446	2	WY	WYOMING	1
447	3	WY	WYOMING	6
448	1	WYOMING	WYOMING	11
449	2	WYOMING	WYOMING	1
450	1	YK	YUKON	11
451	2	YK	YUKON	1
452	3	YK	YUKON	6
453	1	YT	YUKON	11
454	2	YT	YUKON	1
455	3	YT	YUKON	6
456	1	YUKON	YUKON	11
457	2	YUKON	YUKON	1
458	1	BOIS D ARC	BOIS D ARC	10
459	1	BOIS D'ARC	BOIS D ARC	10
460	1	CAMP H M SMITH	CAMP H M SMITH	10
461	1	CAMP HM SMITH	CAMP H M SMITH	10
462	1	COEUR D ALENE	COEUR D ALENE	10
463	1	COEUR D'ALENE	COEUR D ALENE	10
464	1	D HANIS	D HANIS	10
465	1	D'HANIS	D HANIS	10
466	1	EL PASO	EL PASO	10
467	2	EL PASO	EL PASO	1
468	1	FORT GEORGE G MEADE	FORT GEORGE G MEADE	10
469	1	FORT GEORGE MEADE	FORT GEORGE G MEADE	10
470	1	FORT MEADE	FORT GEORGE G MEADE	10
471	1	LAND O LAKES	LAND O LAKES	10
472	1	LAND O'LAKES	LAND O LAKES	10
473	1	M C B H KANEOHE BAY	M C B H KANEOHE BAY	10
474	1	MCBH KANEOHE BAY	M C B H KANEOHE BAY	10
475	1	N VAN	NORTH VANCOUVER	10
476	1	N VANCOUVER	NORTH VANCOUVER	10
477	1	NO VANCOUVER	NORTH VANCOUVER	10
478	1	NORTH VANCOUVER	NORTH VANCOUVER	10
479	1	O BRIEN	O BRIEN	10
480	1	O'BRIEN	O BRIEN	10
481	1	O FALLON	O FALLON	10
482	1	O'FALLON	O FALLON	10
483	1	O NEALS	O NEALS	10
484	1	O'NEALS	O NEALS	10
485	1	ROUND O	ROUND O	10
486	1	S COFFEYVILLE	SOUTH COFFEYVILLE	10
487	1	SOUTH COFFEYVILLE	SOUTH COFFEYVILLE	10
488	1	U S A F ACADEMY	U S A F ACADEMY	10
489	1	USAF ACADEMY	U S A F ACADEMY	10
490	1	W VAN	WEST VANCOUVER	10
491	1	W VANCOUVER	WEST VANCOUVER	10
492	1	WEST VANCOUVER	WEST VANCOUVER	10
493	1	AU GRES	AU GRES	10
494	1	AU SABLE FORKS	AU SABLE FORKS	10
495	1	AU SABLE FRKS	AU SABLE FORKS	10
496	1	AU TRAIN	AU TRAIN	10
497	1	AVON BY THE SEA	AVON BY THE SEA	10
498	1	AVON BY SEA	AVON BY THE SEA	10
499	1	BAYOU LA BATRE	BAYOU LA BATRE	10
500	1	BIRD IN HAND	BIRD IN HAND	10
501	1	CAMDEN ON GAULEY	CAMDEN ON GAULEY	10
502	1	CARDIFF BY THE SEA	CARDIFF BY THE SEA	10
503	1	CARDIFF BY SEA	CARDIFF BY THE SEA	10
504	1	CASTLETON ON HUDSON	CASTLETON ON HUDSON	10
505	1	CAVE IN ROCK	CAVE IN ROCK	10
506	1	CORNWALL ON HUDSON	CORNWALL ON HUDSON	10
507	1	CROTON ON HUDSON	CROTON ON HUDSON	10
508	1	DE BEQUE	DE BEQUE	10
509	1	DE BERRY	DE BERRY	10
510	1	DE FOREST	DE FOREST	10
511	1	DE GRAFF	DE GRAFF	10
512	1	DE KALB	DE KALB	10
513	1	DE KALB JUNCTION	DE KALB JUNCTION	10
514	1	DE LAND	DE LAND	10
515	1	DE LEON	DE LEON	10
516	1	DE LEON SPRINGS	DE LEON SPRINGS	10
517	1	DE MOSSVILLE	DE MOSSVILLE	10
518	1	DE PERE	DE PERE	10
519	1	DE PEYSTER	DE PEYSTER	10
520	1	DE QUEEN	DE QUEEN	10
521	1	DE RUYTER	DE RUYTER	10
522	1	DE SMET	DE SMET	10
523	1	DE SOTO	DE SOTO	10
524	1	DE TOUR VILLAGE	DE TOUR VILLAGE	10
525	1	DE VALLS BLUFF	DE VALLS BLUFF	10
526	1	VALLS BLUFF	DE VALLS BLUFF	10
527	1	DE WITT	DE WITT	10
528	1	DE YOUNG	DE YOUNG	10
529	1	DU BOIS	DU BOIS	10
530	1	DU PONT	DU PONT	10
531	1	DU QUOIN	DU QUOIN	10
532	1	E MC KEESPORT	EAST MC KEESPORT	10
533	1	E MCKEESPORT	EAST MC KEESPORT	10
534	1	EAST MC KEESPORT	EAST MC KEESPORT	10
535	1	EAST MCKEESPORT	EAST MC KEESPORT	10
536	1	EL CAJON	EL CAJON	10
537	1	EL CAMPO	EL CAMPO	10
538	1	EL CENTRO	EL CENTRO	10
539	1	EL CERRITO	EL CERRITO	10
540	1	EL DORADO	EL DORADO	10
541	1	EL DORADO HILLS	EL DORADO HILLS	10
542	1	EL DORADO SPRINGS	EL DORADO SPRINGS	10
543	1	EL MIRAGE	EL MIRAGE	10
544	1	EL MONTE	EL MONTE	10
545	1	EL NIDO	EL NIDO	10
546	1	EL PRADO	EL PRADO	10
547	1	EL RENO	EL RENO	10
548	1	EL RITO	EL RITO	10
549	1	EL SEGUNDO	EL SEGUNDO	10
550	1	EL SOBRANTE	EL SOBRANTE	10
551	1	FALLS OF ROUGH	FALLS OF ROUGH	10
552	1	FOND DU LAC	FOND DU LAC	10
553	1	FORKS OF SALMON	FORKS OF SALMON	10
554	1	FORT MC COY	FORT MC COY	10
555	1	FORT MCCOY	FORT MC COY	10
556	1	FORT MC KAVETT	FORT MC KAVETT	10
557	1	FORT MCKAVETT	FORT MC KAVETT	10
558	1	FT MITCHELL	FORT MITCHELL	10
559	1	FORT MITCHELL	FORT MITCHELL	10
560	1	FT MYER	FORT MYER	10
561	1	FORT MYER	FORT MYER	10
562	1	FT WARREN AFB	FORT WARREN AFB	10
563	1	FORT WARREN AFB	FORT WARREN AFB	10
564	1	HASTINGS ON HUDSON	HASTINGS ON HUDSON	10
565	1	HAVRE DE GRACE	HAVRE DE GRACE	10
566	1	HI HAT	HI HAT	10
567	1	HO HO KUS	HO HO KUS	10
568	1	HOWEY IN THE HILLS	HOWEY IN THE HILLS	10
569	1	HOWEY IN HILLS	HOWEY IN THE HILLS	10
570	1	ISLE LA MOTTE	ISLE LA MOTTE	10
571	1	ISLE OF PALMS	ISLE OF PALMS	10
572	1	ISLE OF SPRINGS	ISLE OF SPRINGS	10
573	1	JAY EM	JAY EM	10
574	1	KING OF PRUSSIA	KING OF PRUSSIA	10
575	1	LA BARGE	LA BARGE	10
576	1	LA BELLE	LA BELLE	10
577	1	LA CANADA FLINTRIDGE	LA CANADA FLINTRIDGE	10
578	1	LA CENTER	LA CENTER	10
579	1	LA CONNER	LA CONNER	10
580	1	LA COSTE	LA COSTE	10
581	1	LA CRESCENT	LA CRESCENT	10
582	1	LA CRESCENTA	LA CRESCENTA	10
583	1	LA CROSSE	LA CROSSE	10
584	1	LA FARGE	LA FARGE	10
585	1	LA FARGEVILLE	LA FARGEVILLE	10
586	1	LA FAYETTE	LA FAYETTE	10
587	1	LA FERIA	LA FERIA	10
588	1	LA FOLLETTE	LA FOLLETTE	10
589	1	LA FONTAINE	LA FONTAINE	10
590	1	LA GRANDE	LA GRANDE	10
591	1	LA GRANGE	LA GRANGE	10
592	1	LA GRANGE PARK	LA GRANGE PARK	10
593	1	LA HABRA	LA HABRA	10
594	1	LA HARPE	LA HARPE	10
595	1	LA HONDA	LA HONDA	10
596	1	LA JARA	LA JARA	10
597	1	LA JOLLA	LA JOLLA	10
598	1	LA JOSE	LA JOSE	10
599	1	LA JOYA	LA JOYA	10
600	1	LA JUNTA	LA JUNTA	10
601	1	LA LOMA	LA LOMA	10
602	1	LA LUZ	LA LUZ	10
603	1	LA MADERA	LA MADERA	10
604	1	LA MARQUE	LA MARQUE	10
605	1	LA MESA	LA MESA	10
606	1	LA MIRADA	LA MIRADA	10
607	1	LA MOILLE	LA MOILLE	10
608	1	LA MONTE	LA MONTE	10
609	1	LA MOTTE	LA MOTTE	10
610	1	LA PALMA	LA PALMA	10
611	1	LA PINE	LA PINE	10
612	1	LA PLACE	LA PLACE	10
613	1	LA PLATA	LA PLATA	10
614	1	LA PORTE	LA PORTE	10
615	1	LA PORTE CITY	LA PORTE CITY	10
616	1	LA PRAIRIE	LA PRAIRIE	10
617	1	LA PUENTE	LA PUENTE	10
618	1	LA QUINTA	LA QUINTA	10
619	1	LA RUE	LA RUE	10
620	1	LA RUSSELL	LA RUSSELL	10
621	1	LA SALLE	LA SALLE	10
622	1	LA VALLE	LA VALLE	10
623	1	LA VERGNE	LA VERGNE	10
624	1	LA VERKIN	LA VERKIN	10
625	1	LA VERNE	LA VERNE	10
626	1	LA VERNIA	LA VERNIA	10
627	1	LA VETA	LA VETA	10
628	1	LA VISTA	LA VISTA	10
629	1	LAC DU FLAMBEAU	LAC DU FLAMBEAU	10
630	1	LAKE IN THE HILLS	LAKE IN THE HILLS	10
631	1	LAKE IN HILLS	LAKE IN THE HILLS	10
632	1	LE CENTER	LE CENTER	10
633	1	LE CLAIRE	LE CLAIRE	10
634	1	LE GRAND	LE GRAND	10
635	1	LE MARS	LE MARS	10
636	1	LE RAYSVILLE	LE RAYSVILLE	10
637	1	LE ROY	LE ROY	10
638	1	LE SUEUR	LE SUEUR	10
639	1	LE VERNE	LU VERNE	10
640	1	LU VERNE	LU VERNE	10
641	1	MARINE ON SAINT CROIX	MARINE ON SAINT CROIX	10
642	1	MC ADENVILLE	MC ADENVILLE	10
643	1	MCADENVILLE	MC ADENVILLE	10
644	1	MC ALISTER	MC ALISTER	10
645	1	MCALISTER	MC ALISTER	10
646	1	MC ALISTERVILLE	MC ALISTERVILLE	10
647	1	MCALISTERVILLE	MC ALISTERVILLE	10
648	1	MC ALPIN	MC ALPIN	10
649	1	MCALPIN	MC ALPIN	10
650	1	MC ANDREWS	MC ANDREWS	10
651	1	MCANDREWS	MC ANDREWS	10
652	1	MC ARTHUR	MC ARTHUR	10
653	1	MCARTHUR	MC ARTHUR	10
654	1	MC BAIN	MC BAIN	10
655	1	MCBAIN	MC BAIN	10
656	1	MC BEE	MC BEE	10
657	1	MCBEE	MC BEE	10
658	1	MC CALL CREEK	MC CALL CREEK	10
659	1	MCCALL CREEK	MC CALL CREEK	10
660	1	MC CALLA	MC CALLA	10
661	1	MCCALLA	MC CALLA	10
662	1	MC CALLSBURG	MC CALLSBURG	10
663	1	MCCALLSBURG	MC CALLSBURG	10
664	1	MC CAMEY	MC CAMEY	10
665	1	MCCAMEY	MC CAMEY	10
666	1	MC CARLEY	MC CARLEY	10
667	1	MCCARLEY	MC CARLEY	10
668	1	MC CARR	MC CARR	10
669	1	MCCARR	MC CARR	10
670	1	MC CASKILL	MC CASKILL	10
671	1	MCCASKILL	MC CASKILL	10
672	1	MC CAULLEY	MC CAULLEY	10
673	1	MCCAULLEY	MC CAULLEY	10
674	1	MC CAYSVILLE	MC CAYSVILLE	10
675	1	MCCAYSVILLE	MC CAYSVILLE	10
676	1	MC CLAVE	MC CLAVE	10
677	1	MCCLAVE	MC CLAVE	10
678	1	MC CLELLAND	MC CLELLAND	10
679	1	MCCLELLAND	MC CLELLAND	10
680	1	MC CLELLANDTOWN	MC CLELLANDTOWN	10
681	1	MCCLELLANDTOWN	MC CLELLANDTOWN	10
682	1	MC CLELLANVILLE	MC CLELLANVILLE	10
683	1	MCCLELLANVILLE	MC CLELLANVILLE	10
684	1	MC CLURE	MC CLURE	10
685	1	MCCLURE	MC CLURE	10
686	1	MC CLURG	MC CLURG	10
687	1	MCCLURG	MC CLURG	10
688	1	MC COLL	MC COLL	10
689	1	MCCOLL	MC COLL	10
690	1	MC COMB	MC COMB	10
691	1	MCCOMB	MC COMB	10
692	1	MC CONNELL	MC CONNELL	10
693	1	MCCONNELL	MC CONNELL	10
694	1	MC CONNELLS	MC CONNELLS	10
695	1	MCCONNELLS	MC CONNELLS	10
696	1	MC CONNELLSBURG	MC CONNELLSBURG	10
697	1	MCCONNELLSBURG	MC CONNELLSBURG	10
698	1	MC COOK	MC COOK	10
699	1	MCCOOK	MC COOK	10
700	1	MC COOL	MC COOL	10
701	1	MCCOOL	MC COOL	10
702	1	MC COOL JUNCTION	MC COOL JUNCTION	10
703	1	MCCOOL JUNCTION	MC COOL JUNCTION	10
704	1	MC CORDSVILLE	MC CORDSVILLE	10
705	1	MCCORDSVILLE	MC CORDSVILLE	10
706	1	MC CORMICK	MC CORMICK	10
707	1	MCCORMICK	MC CORMICK	10
708	1	MC COY	MC COY	10
709	1	MCCOY	MC COY	10
710	1	MC CRACKEN	MC CRACKEN	10
711	1	MCCRACKEN	MC CRACKEN	10
712	1	MC CRORY	MC CRORY	10
713	1	MCCRORY	MC CRORY	10
714	1	MC CUNE	MC CUNE	10
715	1	MCCUNE	MC CUNE	10
716	1	MC CUTCHENVILLE	MC CUTCHENVILLE	10
717	1	MCCUTCHENVILLE	MC CUTCHENVILLE	10
718	1	MC DADE	MC DADE	10
719	1	MCDADE	MC DADE	10
720	1	MC DANIELS	MC DANIELS	10
721	1	MCDANIELS	MC DANIELS	10
722	1	MC DAVID	MC DAVID	10
723	1	MCDAVID	MC DAVID	10
724	1	MC DERMOTT	MC DERMOTT	10
725	1	MCDERMOTT	MC DERMOTT	10
726	1	MC DONALD	MC DONALD	10
727	1	MCDONALD	MC DONALD	10
728	1	MC DONOUGH	MC DONOUGH	10
729	1	MCDONOUGH	MC DONOUGH	10
730	1	MC DOWELL	MC DOWELL	10
731	1	MCDOWELL	MC DOWELL	10
732	1	MC EWEN	MC EWEN	10
733	1	MCEWEN	MC EWEN	10
734	1	MC FALL	MC FALL	10
735	1	MCFALL	MC FALL	10
736	1	MC FARLAND	MC FARLAND	10
737	1	MCFARLAND	MC FARLAND	10
738	1	MC GAHEYSVILLE	MC GAHEYSVILLE	10
739	1	MCGAHEYSVILLE	MC GAHEYSVILLE	10
740	1	MC GEE	MC GEE	10
741	1	MCGEE	MC GEE	10
742	1	MC GEHEE	MC GEHEE	10
743	1	MCGEHEE	MC GEHEE	10
744	1	MC GRADY	MC GRADY	10
745	1	MCGRADY	MC GRADY	10
746	1	MC GRATH	MC GRATH	10
747	1	MCGRATH	MC GRATH	10
748	1	MC GRAW	MC GRAW	10
749	1	MCGRAW	MC GRAW	10
750	1	MC GREGOR	MC GREGOR	10
751	1	MCGREGOR	MC GREGOR	10
752	1	MC HENRY	MC HENRY	10
753	1	MCHENRY	MC HENRY	10
754	1	MC INTIRE	MC INTIRE	10
755	1	MCINTIRE	MC INTIRE	10
756	1	MC INTOSH	MC INTOSH	10
757	1	MCINTOSH	MC INTOSH	10
758	1	MC INTYRE	MC INTYRE	10
759	1	MCINTYRE	MC INTYRE	10
760	1	MC KEAN	MC KEAN	10
761	1	MCKEAN	MC KEAN	10
762	1	MC KEE	MC KEE	10
763	1	MCKEE	MC KEE	10
764	1	MC KEES ROCKS	MC KEES ROCKS	10
765	1	MCKEES ROCKS	MC KEES ROCKS	10
766	1	MC KENNEY	MC KENNEY	10
767	1	MCKENNEY	MC KENNEY	10
768	1	MC KENZIE	MC KENZIE	10
769	1	MCKENZIE	MC KENZIE	10
770	1	MC KITTRICK	MC KITTRICK	10
771	1	MCKITTRICK	MC KITTRICK	10
772	1	MC LAIN	MC LAIN	10
773	1	MCLAIN	MC LAIN	10
774	1	MC LAUGHLIN	MC LAUGHLIN	10
775	1	MCLAUGHLIN	MC LAUGHLIN	10
776	1	MC LEAN	MC LEAN	10
777	1	MCLEAN	MC LEAN	10
778	1	MC LEANSBORO	MC LEANSBORO	10
779	1	MCLEANSBORO	MC LEANSBORO	10
780	1	MC LEANSVILLE	MC LEANSVILLE	10
781	1	MCLEANSVILLE	MC LEANSVILLE	10
782	1	MC LEOD	MC LEOD	10
783	1	MCLEOD	MC LEOD	10
784	1	MC LOUTH	MC LOUTH	10
785	1	MCLOUTH	MC LOUTH	10
786	1	MC MILLAN	MC MILLAN	10
787	1	MCMILLAN	MC MILLAN	10
788	1	MC MINNVILLE	MC MINNVILLE	10
789	1	MCMINNVILLE	MC MINNVILLE	10
790	1	MC NABB	MC NABB	10
791	1	MCNABB	MC NABB	10
792	1	MC NEAL	MC NEAL	10
793	1	MCNEAL	MC NEAL	10
794	1	MC NEIL	MC NEIL	10
795	1	MCNEIL	MC NEIL	10
796	1	MC QUEENEY	MC QUEENEY	10
797	1	MCQUEENEY	MC QUEENEY	10
798	1	MC RAE	MC RAE	10
799	1	MCRAE	MC RAE	10
800	1	MC ROBERTS	MC ROBERTS	10
801	1	MCROBERTS	MC ROBERTS	10
802	1	MC SHERRYSTOWN	MC SHERRYSTOWN	10
803	1	MCSHERRYSTOWN	MC SHERRYSTOWN	10
804	1	MC VEYTOWN	MC VEYTOWN	10
805	1	MCVEYTOWN	MC VEYTOWN	10
806	1	MEADOWS OF DAN	MEADOWS OF DAN	10
807	1	MI WUK VILLAGE	MI WUK VILLAGE	10
808	1	MOUTH OF WILSON	MOUTH OF WILSON	10
809	1	MT ZION	MOUNT ZION	10
810	1	MOUNT ZION	MOUNT ZION	10
811	1	PE ELL	PE ELL	10
812	1	POINT OF ROCKS	POINT OF ROCKS	10
813	1	PONCE DE LEON	PONCE DE LEON	10
814	1	PRAIRIE DU CHIEN	PRAIRIE DU CHIEN	10
815	1	PRAIRIE DU ROCHER	PRAIRIE DU ROCHER	10
816	1	PRAIRIE DU SAC	PRAIRIE DU SAC	10
817	1	RANCHO SANTA FE	RANCHO SANTA FE	10
818	1	RANCHOS DE TAOS	RANCHOS DE TAOS	10
819	1	SANTA FE	SANTA FE	10
820	1	SANTA FE SPRINGS	SANTA FE SPRINGS	10
821	1	S EL MONTE	SOUTH EL MONTE	10
822	1	SOUTH EL MONTE	SOUTH EL MONTE	10
823	1	SAINT COLUMBANS	SAINT COLUMBANS	10
824	1	ST COLUMBANS	SAINT COLUMBANS	10
825	1	TOWNSHIP OF WASHINGTON	TOWNSHIP OF WASHINGTON	10
826	1	TRUTH OR CONSEQUENCES	TRUTH OR CONSEQUENCES	10
827	1	TY TY	TY TY	10
828	1	VILLAGE OF NAGOG WOODS	VILLAGE OF NAGOG WOODS	10
829	1	ST AGATHA	SAINT AGATHA	10
830	1	ST ALBANS	SAINT ALBANS	10
831	1	ST ANDREWS	SAINT ANDREWS	10
832	1	ST ANN	SAINT ANN	10
833	1	ST ANN HIGHLANDS	SAINT ANN HIGHLANDS	10
834	1	ST ANNA	SAINT ANNA	10
835	1	ST ANNE	SAINT ANNE	10
836	1	ST ANSGAR	SAINT ANSGAR	10
837	1	ST ANTHONY	SAINT ANTHONY	10
838	1	ST ARMAND	SAINT ARMAND	10
839	1	ST AUBERT	SAINT AUBERT	10
840	1	ST AUGUSTA	SAINT AUGUSTA	10
841	1	ST AUGUSTINE	SAINT AUGUSTINE	10
842	1	ST AUGUSTINE BEACH	SAINT AUGUSTINE BEACH	10
843	1	ST AUGUSTINE SHORES	SAINT AUGUSTINE SHORES	10
844	1	ST AUGUSTINE SOUTH	SAINT AUGUSTINE SOUTH	10
845	1	ST BENEDICT	SAINT BENEDICT	10
846	1	ST BERNARD	SAINT BERNARD	10
847	1	ST BERNICE	SAINT BERNICE	10
848	1	ST BONAVENTURE	SAINT BONAVENTURE	10
849	1	ST BONIFACIUS	SAINT BONIFACIUS	10
850	1	ST BRIDGET	SAINT BRIDGET	10
851	1	ST CHARLES	SAINT CHARLES	10
852	1	ST CHARLES MESA	SAINT CHARLES MESA	10
853	1	ST CHARLES PARISH	SAINT CHARLES PARISH	10
854	1	ST CLAIR	SAINT CLAIR	10
855	1	ST CLAIR SHORES	SAINT CLAIR SHORES	10
856	1	ST CLAIRSVILLE	SAINT CLAIRSVILLE	10
857	1	ST CLEMENT	SAINT CLEMENT	10
858	1	ST CLERE	SAINT CLERE	10
859	1	ST CLOUD	SAINT CLOUD	10
860	1	ST CROIX	SAINT CROIX	10
861	1	ST CROIX FALLS	SAINT CROIX FALLS	10
862	1	ST DAVID	SAINT DAVID	10
863	1	ST DONATUS	SAINT DONATUS	10
864	1	ST EDWARD	SAINT EDWARD	10
865	1	ST ELIZABETH	SAINT ELIZABETH	10
866	1	ST ELMO	SAINT ELMO	10
867	1	ST FERDINAND	SAINT FERDINAND	10
868	1	ST FLORIAN	SAINT FLORIAN	10
869	1	ST FRANCIS	SAINT FRANCIS	10
870	1	ST FRANCISVILLE	SAINT FRANCISVILLE	10
871	1	ST FRANCOIS	SAINT FRANCOIS	10
872	1	ST GABRIEL	SAINT GABRIEL	10
873	1	ST GEORGE	SAINT GEORGE	10
874	1	ST GEORGE ISLAND	SAINT GEORGE ISLAND	10
875	1	ST GEORGES	SAINT GEORGES	10
876	1	ST GERMAIN	SAINT GERMAIN	10
877	1	ST HEDWIG	SAINT HEDWIG	10
878	1	ST HELEN	SAINT HELEN	10
879	1	ST HELENA	SAINT HELENA	10
880	1	ST HELENA ISLAND	SAINT HELENA ISLAND	10
881	1	ST HELENA PARISH	SAINT HELENA PARISH	10
882	1	ST HELENS	SAINT HELENS	10
883	1	ST HENRY	SAINT HENRY	10
884	1	ST HILAIRE	SAINT HILAIRE	10
885	1	ST IGNACE	SAINT IGNACE	10
886	1	ST IGNATIUS	SAINT IGNATIUS	10
887	1	ST JACOB	SAINT JACOB	10
888	1	ST JAMES	SAINT JAMES	10
889	1	ST JAMES CITY	SAINT JAMES CITY	10
890	1	ST JAMES PARISH	SAINT JAMES PARISH	10
891	1	ST JO	SAINT JO	10
892	1	ST JOE	SAINT JOE	10
893	1	ST JOHN	SAINT JOHN	10
894	1	ST JOHNS	SAINT JOHNS	10
895	1	ST JOHNS-FREEMONT	SAINT JOHNS-FREEMONT	10
896	1	ST JOHNS FREEMONT	SAINT JOHNS-FREEMONT	10
897	1	ST JOHNSBURY	SAINT JOHNSBURY	10
898	1	ST JOHNSVILLE	SAINT JOHNSVILLE	10
899	1	ST JOHN THE BAPTIST PARISH	SAINT JOHN THE BAPTIST PARISH	10
900	1	ST JOSEPH	SAINT JOSEPH	10
901	1	ST JUST	SAINT JUST	10
902	1	ST LANDRY PARISH	SAINT LANDRY PARISH	10
903	1	ST LAWRENCE	SAINT LAWRENCE	10
904	1	ST LEO	SAINT LEO	10
905	1	ST LEON	SAINT LEON	10
906	1	ST LEONARD	SAINT LEONARD	10
907	1	ST LIBORY	SAINT LIBORY	10
908	1	ST LOUIS	SAINT LOUIS	10
909	1	ST LOUIS PARK	SAINT LOUIS PARK	10
910	1	ST LOUISVILLE	SAINT LOUISVILLE	10
911	1	ST LUCAS	SAINT LUCAS	10
912	1	ST LUCIE VILLAGE	SAINT LUCIE VILLAGE	10
913	1	ST MARIE	SAINT MARIE	10
914	1	ST MARIES	SAINT MARIES	10
915	1	ST MARKS	SAINT MARKS	10
916	1	ST MARTIN	SAINT MARTIN	10
917	1	ST MARTIN PARISH	SAINT MARTIN PARISH	10
918	1	ST MARTINS	SAINT MARTINS	10
919	1	ST MARTINVILLE	SAINT MARTINVILLE	10
920	1	ST MARY	SAINT MARY	10
921	1	ST MARY OF THE WOODS	SAINT MARY OF THE WOODS	10
922	1	ST MARY'S	SAINT MARY'S	10
923	1	ST MARYS	SAINT MARYS	10
924	1	ST MARYS POINT	SAINT MARYS POINT	10
925	1	ST MATHIAS	SAINT MATHIAS	10
926	1	ST MATTHEWS	SAINT MATTHEWS	10
927	1	ST MAURICE	SAINT MAURICE	10
928	1	ST MEINRAD	SAINT MEINRAD	10
929	1	ST MICHAEL	SAINT MICHAEL	10
930	1	ST MICHAELS	SAINT MICHAELS	10
931	1	ST NAZIANZ	SAINT NAZIANZ	10
932	1	ST OLAF	SAINT OLAF	10
933	1	ST ONGE	SAINT ONGE	10
934	1	ST PARIS	SAINT PARIS	10
935	1	ST PAUL	SAINT PAUL	10
936	1	ST PAUL PARK	SAINT PAUL PARK	10
937	1	ST PAULS	SAINT PAULS	10
938	1	ST PETE BEACH	SAINT PETE BEACH	10
939	1	ST PETER	SAINT PETER	10
940	1	ST PETERS	SAINT PETERS	10
941	1	ST PETERSBURG	SAINT PETERSBURG	10
942	1	ST PIERRE	SAINT PIERRE	10
943	1	ST REGIS	SAINT REGIS	10
944	1	ST REGIS FALLS	SAINT REGIS FALLS	10
945	1	ST REGIS MOHAWK	SAINT REGIS MOHAWK	10
946	1	ST REGIS PARK	SAINT REGIS PARK	10
947	1	ST ROBERT	SAINT ROBERT	10
948	1	ST ROSA	SAINT ROSA	10
949	1	ST ROSE	SAINT ROSE	10
950	1	ST SIMONS	SAINT SIMONS	10
951	1	ST STEPHEN	SAINT STEPHEN	10
952	1	ST STEPHENS	SAINT STEPHENS	10
953	1	ST STEPHENS CHURCH	SAINT STEPHENS CHURCH	10
954	1	ST TAMMANY PARISH	SAINT TAMMANY PARISH	10
955	1	ST THOMAS	SAINT THOMAS	10
956	1	ST VINCENT	SAINT VINCENT	10
957	1	ST VINCENT COLLEGE	SAINT VINCENT COLLEGE	10
958	1	ST WENDEL	SAINT WENDEL	10
959	1	ST XAVIER	SAINT XAVIER	10
960	1	SAINT AGATHA	SAINT AGATHA	10
961	1	SAINT ALBANS	SAINT ALBANS	10
962	1	SAINT ANDREWS	SAINT ANDREWS	10
963	1	SAINT ANN	SAINT ANN	10
964	1	SAINT ANN HIGHLANDS	SAINT ANN HIGHLANDS	10
965	1	SAINT ANNA	SAINT ANNA	10
966	1	SAINT ANNE	SAINT ANNE	10
967	1	SAINT ANSGAR	SAINT ANSGAR	10
968	1	SAINT ANTHONY	SAINT ANTHONY	10
969	1	SAINT ARMAND	SAINT ARMAND	10
970	1	SAINT AUBERT	SAINT AUBERT	10
971	1	SAINT AUGUSTA	SAINT AUGUSTA	10
972	1	SAINT AUGUSTINE	SAINT AUGUSTINE	10
973	1	SAINT AUGUSTINE BEACH	SAINT AUGUSTINE BEACH	10
974	1	SAINT AUGUSTINE SHORES	SAINT AUGUSTINE SHORES	10
975	1	SAINT AUGUSTINE SOUTH	SAINT AUGUSTINE SOUTH	10
976	1	SAINT BENEDICT	SAINT BENEDICT	10
977	1	SAINT BERNARD	SAINT BERNARD	10
978	1	SAINT BERNICE	SAINT BERNICE	10
979	1	SAINT BONAVENTURE	SAINT BONAVENTURE	10
980	1	SAINT BONIFACIUS	SAINT BONIFACIUS	10
981	1	SAINT BRIDGET	SAINT BRIDGET	10
982	1	SAINT CHARLES	SAINT CHARLES	10
983	1	SAINT CHARLES MESA	SAINT CHARLES MESA	10
984	1	SAINT CHARLES PARISH	SAINT CHARLES PARISH	10
985	1	SAINT CLAIR	SAINT CLAIR	10
986	1	SAINT CLAIR SHORES	SAINT CLAIR SHORES	10
987	1	SAINT CLAIRSVILLE	SAINT CLAIRSVILLE	10
988	1	SAINT CLEMENT	SAINT CLEMENT	10
989	1	SAINT CLERE	SAINT CLERE	10
990	1	SAINT CLOUD	SAINT CLOUD	10
991	1	SAINT CROIX	SAINT CROIX	10
992	1	SAINT CROIX FALLS	SAINT CROIX FALLS	10
993	1	SAINT DAVID	SAINT DAVID	10
994	1	SAINT DONATUS	SAINT DONATUS	10
995	1	SAINT EDWARD	SAINT EDWARD	10
996	1	SAINT ELIZABETH	SAINT ELIZABETH	10
997	1	SAINT ELMO	SAINT ELMO	10
998	1	SAINT FERDINAND	SAINT FERDINAND	10
999	1	SAINT FLORIAN	SAINT FLORIAN	10
1000	1	SAINT FRANCIS	SAINT FRANCIS	10
1001	1	SAINT FRANCISVILLE	SAINT FRANCISVILLE	10
1002	1	SAINT FRANCOIS	SAINT FRANCOIS	10
1003	1	SAINT GABRIEL	SAINT GABRIEL	10
1004	1	SAINT GEORGE	SAINT GEORGE	10
1005	1	SAINT GEORGE ISLAND	SAINT GEORGE ISLAND	10
1006	1	SAINT GEORGES	SAINT GEORGES	10
1007	1	SAINT GERMAIN	SAINT GERMAIN	10
1008	1	SAINT HEDWIG	SAINT HEDWIG	10
1009	1	SAINT HELEN	SAINT HELEN	10
1010	1	SAINT HELENA	SAINT HELENA	10
1011	1	SAINT HELENA ISLAND	SAINT HELENA ISLAND	10
1012	1	SAINT HELENA PARISH	SAINT HELENA PARISH	10
1013	1	SAINT HELENS	SAINT HELENS	10
1014	1	SAINT HENRY	SAINT HENRY	10
1015	1	SAINT HILAIRE	SAINT HILAIRE	10
1016	1	SAINT IGNACE	SAINT IGNACE	10
1017	1	SAINT IGNATIUS	SAINT IGNATIUS	10
1018	1	SAINT JACOB	SAINT JACOB	10
1019	1	SAINT JAMES	SAINT JAMES	10
1020	1	SAINT JAMES CITY	SAINT JAMES CITY	10
1021	1	SAINT JAMES PARISH	SAINT JAMES PARISH	10
1022	1	SAINT JO	SAINT JO	10
1023	1	SAINT JOE	SAINT JOE	10
1024	1	SAINT JOHN	SAINT JOHN	10
1025	1	SAINT JOHNS	SAINT JOHNS	10
1026	1	SAINT JOHNS-FREEMONT	SAINT JOHNS-FREEMONT	10
1027	1	SAINT JOHNS FREEMONT	SAINT JOHNS-FREEMONT	10
1028	1	SAINT JOHNSBURY	SAINT JOHNSBURY	10
1029	1	SAINT JOHNSVILLE	SAINT JOHNSVILLE	10
1030	1	SAINT JOHN THE BAPTIST PARISH	SAINT JOHN THE BAPTIST PARISH	10
1031	1	SAINT JOSEPH	SAINT JOSEPH	10
1032	1	SAINT JUST	SAINT JUST	10
1033	1	SAINT LANDRY PARISH	SAINT LANDRY PARISH	10
1034	1	SAINT LAWRENCE	SAINT LAWRENCE	10
1035	1	SAINT LEO	SAINT LEO	10
1036	1	SAINT LEON	SAINT LEON	10
1037	1	SAINT LEONARD	SAINT LEONARD	10
1038	1	SAINT LIBORY	SAINT LIBORY	10
1039	1	SAINT LOUIS	SAINT LOUIS	10
1040	1	SAINT LOUIS PARK	SAINT LOUIS PARK	10
1041	1	SAINT LOUISVILLE	SAINT LOUISVILLE	10
1042	1	SAINT LUCAS	SAINT LUCAS	10
1043	1	SAINT LUCIE VILLAGE	SAINT LUCIE VILLAGE	10
1044	1	SAINT MARIE	SAINT MARIE	10
1045	1	SAINT MARIES	SAINT MARIES	10
1046	1	SAINT MARKS	SAINT MARKS	10
1047	1	SAINT MARTIN	SAINT MARTIN	10
1048	1	SAINT MARTINS	SAINT MARTINS	10
1049	1	SAINT MARTINVILLE	SAINT MARTINVILLE	10
1050	1	SAINT MARY	SAINT MARY	10
1051	1	SAINT MARY OF THE WOODS	SAINT MARY OF THE WOODS	10
1052	1	SAINT MARY'S	SAINT MARY'S	10
1053	1	SAINT MARYS	SAINT MARYS	10
1054	1	SAINT MARYS POINT	SAINT MARYS POINT	10
1055	1	SAINT MATHIAS	SAINT MATHIAS	10
1056	1	SAINT MATTHEWS	SAINT MATTHEWS	10
1057	1	SAINT MAURICE	SAINT MAURICE	10
1058	1	SAINT MEINRAD	SAINT MEINRAD	10
1059	1	SAINT MICHAEL	SAINT MICHAEL	10
1060	1	SAINT MICHAELS	SAINT MICHAELS	10
1061	1	SAINT NAZIANZ	SAINT NAZIANZ	10
1062	1	SAINT OLAF	SAINT OLAF	10
1063	1	SAINT ONGE	SAINT ONGE	10
1064	1	SAINT PARIS	SAINT PARIS	10
1065	1	SAINT PAUL	SAINT PAUL	10
1066	1	SAINT PAUL PARK	SAINT PAUL PARK	10
1067	1	SAINT PAULS	SAINT PAULS	10
1068	1	SAINT PETE BEACH	SAINT PETE BEACH	10
1069	1	SAINT PETER	SAINT PETER	10
1070	1	SAINT PETERS	SAINT PETERS	10
1071	1	SAINT PETERSBURG	SAINT PETERSBURG	10
1072	1	SAINT PIERRE	SAINT PIERRE	10
1073	1	SAINT REGIS	SAINT REGIS	10
1074	1	SAINT REGIS FALLS	SAINT REGIS FALLS	10
1075	1	SAINT REGIS MOHAWK	SAINT REGIS MOHAWK	10
1076	1	SAINT REGIS PARK	SAINT REGIS PARK	10
1077	1	SAINT ROBERT	SAINT ROBERT	10
1078	1	SAINT ROSA	SAINT ROSA	10
1079	1	SAINT ROSE	SAINT ROSE	10
1080	1	SAINT SIMONS	SAINT SIMONS	10
1081	1	SAINT STEPHEN	SAINT STEPHEN	10
1082	1	SAINT STEPHENS	SAINT STEPHENS	10
1083	1	SAINT STEPHENS CHURCH	SAINT STEPHENS CHURCH	10
1084	1	SAINT TAMMANY PARISH	SAINT TAMMANY PARISH	10
1085	1	SAINT THOMAS	SAINT THOMAS	10
1086	1	SAINT VINCENT	SAINT VINCENT	10
1087	1	SAINT VINCENT COLLEGE	SAINT VINCENT COLLEGE	10
1088	1	SAINT WENDEL	SAINT WENDEL	10
1089	1	SAINT XAVIER	SAINT XAVIER	10
\.