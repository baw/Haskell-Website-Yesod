module Handler.Redirects where

import Import

redirect301 :: String -> Handler Html
redirect301 = redirectWith status301

getAsteroidsR :: Handler Html
getAsteroidsR = do
    redirect301 "https://baw.github.io/asteroids/"

getCommunityChatR :: Handler Html
getCommunityChatR = do
    redirect301 "http://baw.github.io/community_chat/"
