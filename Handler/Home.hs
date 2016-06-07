module Handler.Home where

import Import
import Text.Julius (rawJS)

import Handler.Util (getProjects)

getHomeR :: Handler Html
getHomeR = do
    let clickId = "" :: Text
    projects <- getProjects
    defaultLayout $ do
        setTitle "Brian Weiser - Web Developer"
        $(widgetFile "homepage")
