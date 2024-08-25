module Theme exposing (Theme(..), next, toString)


type Theme
    = Light
    | Dark


toString : Theme -> String
toString theme =
    case theme of
        Light ->
            "light"

        Dark ->
            "dark"


next : Theme -> Theme
next theme =
    case theme of
        Light ->
            Dark

        Dark ->
            Light
