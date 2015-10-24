module Handler.Blog where

import Import

getBlogIndexR :: Handler Html
getBlogIndexR = do
  allPosts <- runDB $ selectList [] [Desc BlogPostCreatedDate, LimitTo 5]
  -- TODO: figure out how to index into [Entity BlogPost]
  let firstPost = take 1 allPosts
  defaultLayout $ do
    setTitle "Blog - Brian Weiser - Web Developer"
    $(widgetFile "blog/index")

getBlogShowR :: BlogPostId -> Handler Html
getBlogShowR blogPostId = do
  blogPost <- runDB $ get404 blogPostId
  defaultLayout $ do
    setTitle "Blog - Brian Weiser - Web Developer"
    $(widgetFile "blog/post")
