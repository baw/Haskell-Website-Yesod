module Handler.Home where

import Import
import Text.Julius (rawJS)

getHomeR :: Handler Html
getHomeR = do
    let clickId = "" :: Text
    defaultLayout $ do
        setTitle "Brian Weiser - Web Developer"
        $(widgetFile "homepage")
