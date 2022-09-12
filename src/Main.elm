module Main exposing (main)

import Browser
import Html
import Svg exposing (Svg)
import Svg.Attributes as Attributes


type Msg
    = NoOp


main : Program () () Msg
main =
    Browser.sandbox { init = (), update = update, view = view }


update : Msg -> () -> ()
update msg model =
    ()


view : () -> Svg Msg
view _ =
    Svg.svg
        [ Attributes.width "1000"
        , Attributes.height "1000"
        , Attributes.viewBox "0 0 1000 1000"
        ]
        [ hexagonGrid 20 15
        ]


hexagonGrid : Int -> Int -> Svg Msg
hexagonGrid cols rows =
    let
        size =
            25

        width =
            2 * size

        height =
            sin (pi / 3) * size * 2

        verticalOffset col =
            if modBy 2 col == 0 then
                0

            else
                height / 2

        cartesian xs ys =
            List.concatMap
                (\x -> List.map (\y -> ( x, y )) ys)
                xs

        coordinates : List ( Int, Int )
        coordinates =
            cartesian (List.range 0 <| cols - 1) (List.range 0 <| rows - 1)

        centerPoint ( col, row ) =
            ( size + toFloat col * width * 0.75, size + toFloat row * height + verticalOffset col )
    in
    Svg.g [] (List.map (centerPoint >> hexagon size) coordinates)


hexagon : Float -> ( Float, Float ) -> Svg Msg
hexagon size ( centerX, centerY ) =
    let
        -- Given a corner number from 0 - 5 use the center & size to find
        -- each coordinate of the hexagon's corners
        hexCorner : Float -> ( Float, Float )
        hexCorner i =
            ( centerX + size * cos ((pi / 3) * i)
            , centerY + size * sin ((pi / 3) * i)
            )

        pointToString : ( Float, Float ) -> String
        pointToString ( x, y ) =
            String.fromFloat x ++ "," ++ String.fromFloat y

        points : String
        points =
            List.range 0 5
                |> List.map (toFloat >> hexCorner >> pointToString)
                |> String.join " "
    in
    Svg.polygon
        [ Attributes.points points
        , Attributes.stroke "white"
        , Attributes.color "white"
        ]
        [ Svg.text "World" ]
