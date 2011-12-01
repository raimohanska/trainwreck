{-# LANGUAGE OverloadedStrings, DeriveDataTypeable #-}

module ConstantReply where

import           Snap.Http.Server
import           Control.Monad
import           Control.Monad.Trans(liftIO)
import           Snap.Core
import           Data.Typeable
import           Data.Data
import           Text.JSON.Generic
import           Util.HttpUtil
import           Control.Concurrent.STM

type Train = [Ticket]
data TicketRequest = TicketRequest { amount :: Int } deriving (Data, Typeable, Show)
data Ticket = Ticket { car :: Int, seat :: Int } deriving (Data, Typeable, Show)

orderTicket = method POST $ catchError "VR pahoittelee" $ do 
    ticketRequest <- (liftM decodeJSON readBody) :: Snap TicketRequest
    writeResponse $ encodeJSON $ someTickets

main :: IO ()
main = serve defaultConfig

serve :: Config Snap a -> IO()
serve config = httpServe config $ route [ 
    ("/ticket", orderTicket)
    ] 

someTickets = [ Ticket 1 1, Ticket 1 2 ]
