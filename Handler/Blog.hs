module Handler.Blog where

import Import

getBlogIndexR :: Handler Html
getBlogIndexR = do
  allPosts <- runDB $ selectList [] [Desc BlogPostId]
  defaultLayout $ do
    $(widgetFile "blog/index")
