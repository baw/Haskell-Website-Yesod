module Handler.Projects where

import Import
import Text.Julius (rawJS)

getProjectsR :: Handler Html
getProjectsR = do
    let clickId = "projectsLink" :: Text
    defaultLayout $ do
        setTitle "Brian Weiser - Web Developer"
        $(widgetFile "homepage")
