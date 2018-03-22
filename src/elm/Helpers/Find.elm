module Helpers.Find exposing (..)

-- import Date exposing (..)
-- import Date.Extra.Config.Config_en_us exposing (..)
-- import Date.Extra.Format exposing (..)
-- import Result exposing (..)

import EveryDict exposing (..)
import GraphCool.Scalar exposing (..)
import Helpers.From as From exposing (..)
import Types exposing (..)


-- -------------------------------- --
-- Create Function name by:         --
-- ReturnType ++ With ++ NeededArgs --
-- -------------------------------- --
-- User --


maybeUserWithChatMeUsers : Chat -> Me -> EveryDict Id User -> Maybe User
maybeUserWithChatMeUsers chat me users =
    if From.idToString me.id == From.idToString chat.initiated then
        -- True if Me is the initiator
        EveryDict.get chat.recipient users
    else if From.idToString me.id == From.idToString chat.recipient then
        -- False if Me is the recipient
        EveryDict.get chat.initiated users
    else
        Nothing



-- Pool --


maybePoolWithAPIPools : API -> EveryDict Id Pool -> Maybe Pool
maybePoolWithAPIPools api pools =
    case api of
        SeatGeek event ->
            List.head <| List.filter (\pool -> pool.seatGeekId == Just (From.idToString event.id)) <| EveryDict.values pools

        GraphCool event ->
            List.head <| List.filter (\pool -> pool.event == Just event.id) <| EveryDict.values pools
