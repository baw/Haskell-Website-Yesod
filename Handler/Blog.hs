module Handler.Blog where

import Import
import Prelude ((!!))

getBlogIndexR :: Handler Html
getBlogIndexR = do
  allPosts <- runDB $ selectList [] [Desc BlogPostCreatedDate, LimitTo 5]
  let Entity _ firstPost = allPosts !! 0
  let Entity nextPostId nextPost = allPosts !! 1
  defaultLayout $ do
    setTitle "Blog - Brian Weiser - Web Developer"
    $(widgetFile "blog/index")

getBlogShowR :: BlogPostId -> Handler Html
getBlogShowR blogPostId = do
  blogPost <- runDB $ get404 blogPostId
  defaultLayout $ do
    setTitle "Blog - Brian Weiser - Web Developer"
    $(widgetFile "blog/post")
