module Handler.Projects where

import Import
import Text.Julius (rawJS)

import Handler.Util (getProjects)

getProjectsR :: Handler Html
getProjectsR = do
    let clickId = "projectsLink" :: Text
    projects <- getProjects
    defaultLayout $ do
        setTitle "Brian Weiser - Software Engineer"
        $(widgetFile "homepage")
