module Handler.Blog where

import Import

getBlogIndexR :: Handler Html
getBlogIndexR = do
  allPosts <- runDB $ selectList [] [Desc BlogPostId]
  defaultLayout $ do
    $(widgetFile "blog/index")

getBlogShowR :: BlogPostId -> Handler Html
getBlogShowR blogPostId = do
  blogPost <- runDB $ get404 blogPostId
  defaultLayout $ do
    $(widgetFile "blog/post")
