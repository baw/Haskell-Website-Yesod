module Handler.Resume where

import Import
import Text.Julius (rawJS)

getResumeR :: Handler Html
getResumeR = do
    let clickId = "resumeLink" :: Text
    defaultLayout $ do
        setTitle "Brian Weiser - Web Developer"
        $(widgetFile "homepage")
