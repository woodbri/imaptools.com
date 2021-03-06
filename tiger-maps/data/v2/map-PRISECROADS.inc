  # map-PRISECROADS.inc
  LABELITEM "RTENUM"
  CLASS
    MAXSCALEDENOM 5000000
    MINSCALEDENOM  300000
    EXPRESSION ('[RTTYP]' = 'I')
    STYLE
      COLOR "#FFC95B"
      WIDTH 1.5
      OUTLINECOLOR "#E9B352"
      OUTLINEWIDTH 0.5
    END
    LABEL
      STYLE
        SYMBOL "I"
      END
      SIZE TINY
      POSITION CC
      OFFSET 1 0
      MINDISTANCE 100
      COLOR "#ffffff"
      PARTIALS FALSE
      PRIORITY 7
    END
  END
  CLASS
    MAXSCALEDENOM 5000000
    MINSCALEDENOM  300000
    EXPRESSION ('[RTTYP]' = 'U' && '[MTFCC]'='S1100')
    STYLE
      COLOR "#F3E999"
      WIDTH 0.5
      OUTLINECOLOR "#ECD390"
      OUTLINEWIDTH 0.5
    END
    LABEL
      STYLE
        SYMBOL "U"
      END
      SIZE TINY
      POSITION CC
      OFFSET 1 0
      MINDISTANCE 100
      COLOR "#000000"
      PARTIALS FALSE
      PRIORITY 7
    END
  END
  CLASS
    MAXSCALEDENOM 5000000
    MINSCALEDENOM  300000
    EXPRESSION ('[RTTYP]' = 'U')
    STYLE
      COLOR "#F3E999"
      WIDTH 0.5
      OUTLINECOLOR "#ECD390"
      OUTLINEWIDTH 0.5
    END
  END
  CLASS
    MAXSCALEDENOM 1000000
    MINSCALEDENOM  300000
    EXPRESSION ('[MTFCC]' = 'S1100')
    STYLE
      COLOR "#FFC95B"
      WIDTH 1.5
      OUTLINECOLOR "#E9B352"
      OUTLINEWIDTH 0.5
    END
  END
  CLASS
    MAXSCALEDENOM 1000000
    MINSCALEDENOM  300000
    EXPRESSION ('[MTFCC]' = 'S1200')
    STYLE
      COLOR "#FFFB89"
      WIDTH 0.75
      OUTLINECOLOR "#ECD390"
      OUTLINEWIDTH 0.5
    END
  END
