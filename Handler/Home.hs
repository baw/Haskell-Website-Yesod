module Handler.Home where

import Import

getHomeR :: Handler Html
getHomeR = do
    let handlerName = "getHomeR" :: Text
    defaultLayout $ do
        setTitle "Welcome To Yesod!"
        $(widgetFile "homepage")
