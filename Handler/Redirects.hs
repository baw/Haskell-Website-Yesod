module Handler.Redirects where

import Import
import qualified Data.Text as T

redirect301 = redirectWith status301

getAsteroidsR :: Handler Html
getAsteroidsR = do
    redirect301 ("https://baw.github.io/asteroids/" :: T.Text)

getCommunityChatR :: Handler Html
getCommunityChatR = do
    redirect301 ("http://baw.github.io/community_chat/" :: T.Text)
