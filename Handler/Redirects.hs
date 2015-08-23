module Handler.Redirects where

import Import
import qualified Data.Text as T

getAsteroidsR :: Handler Html
getAsteroidsR = do
  redirectWith status301 ("https://baw.github.io/asteroids/" :: T.Text)

getCommunityChatR :: Handler Html
getCommunityChatR = do
  redirectWith status301 ("http://baw.github.io/community_chat/" :: T.Text)
