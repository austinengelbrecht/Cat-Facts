module CatFacts exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Http 
import Json.Decode exposing (Decoder, bool, int, string, succeed)
import Json.Decode.Pipeline exposing (optional, required)



-- MAIN

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

main : Program () Model Msg 
main = 
  Browser.element 
    { init = \flags -> (initialModel, initialCmd)
    , update = update 
    , view = view 
    , subscriptions = subscriptions
    }


-- MODEL
type alias Model =
  { fact : String }

-- type alias Model = 
--   { fact : String
--   , status : Status }

initialModel : Model 
initialModel =
  { fact = "" }


initialCmd : Cmd Msg 
initialCmd = 
  Cmd.none 


-- initialModel : Model 
-- initialModel = 
--   { fact = ""
--   , status = Loading
--   }

-- initialCmd : Cmd Msg
-- initialCmd =
--   Http.get 
--     { url = factUrl 
--     , expect = Http.expectJson factDecoder
--     }

-- factDecoder : Decoder Fact 
-- factDecoder = 
--   succeed Fact 
--     |> required "fact" string 
--     |> required "length" int 



--TYPES

-- type Status 
--   = Loading 
--   | Loaded 
--   | Errored String 


-- type alias Fact =
--   { fact : String 
--   , length: Int 
--   }


factUrl : String
factUrl =
  "https://catfact.ninja/fact"


-- HTTP



-- UPDATE
type Msg
  = GetNewFact


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    GetNewFact ->
      ( { model | fact = "nothing" }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text "Cat Facts?"]
    , p [] [ text model.fact ]
    , button [ onClick GetNewFact ] [ text "Get a Fact"]
    ]
  