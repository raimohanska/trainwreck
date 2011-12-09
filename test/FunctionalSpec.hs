module FunctionalSpec where

import Snap.Http.Server.Config
import Test.HUnit
import qualified ConstantReply as Main
import Util.HttpTester

functionalTests = wrapTest withTestServer $ TestList [
  post "Book available tickets" url "/ticket" "{\"amount\": 2}" $ All [ReturnCode 200, Exactly "[{\"car\":1,\"seat\":1},{\"car\":1,\"seat\":2}]"]
  , post "Don't book if not enough available" url "/ticket" "{\"amount\": 3}" $ All [ReturnCode 200, Exactly "[]"]
  ]

port = 8001
url= "http://localhost:" ++ (show port) 

withTestServer = withForkedServer $ Main.serve (setPort port defaultConfig) 
