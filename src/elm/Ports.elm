port module Ports exposing (..)

import Auth0.Auth0 as Auth0 exposing (..)

port auth0authorize : Auth0.Options -> Cmd msg

port auth0authResult : (Auth0.RawAuthenticationResult -> msg) -> Sub msg

port auth0logout : () -> Cmd msg