module Handler.Resume where

import Import
import Text.Julius (rawJS)

import Handler.Util (getProjects)

getResumeR :: Handler Html
getResumeR = do
    let clickId = "resumeLink" :: Text
    projects <- getProjects
    defaultLayout $ do
        setTitle "Brian Weiser - Web Developer"
        $(widgetFile "homepage")
