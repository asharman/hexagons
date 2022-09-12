module World exposing (World)

import Parser exposing ((|.), (|=), Parser)
import Dict exposing (Dict)


type alias Info =
    { name : String
    }


type alias Product =
    { type : String
    , key2 : Bool
    }

type Coordinates
    = Axial { r : Int, q : Int }
    | OddColumn { col : Int, row : Int }


type World
    = World Info Coordinates


-- ADT's
-- Product & Sum
-- fromOddQCoords : { col : Int, row : Int } -> Hexagon
-- fromOddQCoords { col, row } =
--     let
--         q =
--             col
--         r =
--             row - truncate (toFloat (col - modBy 2 col) / 2)
--     in
--     Axial { r = r, q = q } { name}
-- worldParser : Parser World
-- worldParser =
--     let
--         toWorld name col row =
--             World { name = String.trim name } (OddColumn { col = col, row = row })
--         coordinatesHelper : String -> Parser (Parser.Step String Int)
--         coordinatesHelper digits =
--             if String.length digits >= 2 then
--                 case String.toInt digits of
--                     Just int ->
--                         Parser.succeed (Parser.Done int)
--                     Nothing ->
--                         Parser.
--             else
--     in
--     Parser.succeed toWorld
--         |= Parser.chompUntil Char.isDigit
--         |= Parser.loop "" coordinatesHelper


worlds =
    """
Caling Isl        0104 D8B4875-5  N Ag Ni                  101 Ne
Souissin          0105 B331631-8  N Ag Ni               R  210 Ne
Islandia          0107 B5579BD-B  N Ag Ni               R  101 Ne
Norka             0113 C000201-A  N Ag Ni               R  230 Ne
New Jerth         0114 E248730-5  N Ag Ni               A  813 Ne
Norniansas        0118 B677620-8  N Ag Ni               R  703 Ne
Wyominnsin        0119 D556242-3  N Ag Ni               R  622 Ne
Dakotah           0121 C100315-A  N Ag Ni               A  102 Ne
New Jerset        0128 A543000-A  N Ag Ni                  332 Ne
New Hawaii        0132 E6209DB-5  N Ag Ni               R  402 Ne
Wesotand          0134 B7B9578-C  N Ag Ni               A  103 Ne
Alana             0136 C59A610-9  N Ag Ni               R  102 Ne
Amerset           0137 A401520-F  N Ag Ni               R  413 Ne
New Ham           0138 C100301-A  N Ag Ni               R  733 Ne
Wyominiand        0205 A588223-8  N Ag Ni               A  222 Ne
"""
