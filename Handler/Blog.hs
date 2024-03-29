module Handler.Blog where

import Import hiding (head)
import Prelude ((!!), head)
import Database.Persist.Sql (fromSqlKey, toSqlKey)

title :: IsString a => a
title = "Blog - Brian Weiser - Software Engineer"

maybeElement :: [a] -> Int -> Maybe a
maybeElement xs i = if length xs > i then Just (xs !! i) else Nothing

getBlogIndexR :: Handler Html
getBlogIndexR = do
  fiveMostRecentPosts <- runDB $ selectList [] [Desc BlogPostCreatedDate, LimitTo 5]
  let maybeFirstPost = maybeElement fiveMostRecentPosts 0
  let maybePreviousPost = maybeElement fiveMostRecentPosts 1
  let maybeNextPost = Nothing
  defaultLayout $ do
    setTitle title
    $(widgetFile "blog/index")

getBlogShowR :: BlogPostId -> Handler Html
getBlogShowR blogPostId = do
  let previousBlogPostId = fromSqlKey blogPostId - 1
  fiveMostRecentPosts <- runDB $ selectList [] [Desc BlogPostCreatedDate, LimitTo 5]
  closePosts <- runDB $ selectList [BlogPostId >=. (toSqlKey previousBlogPostId)] [Asc BlogPostCreatedDate, LimitTo 3]
  let Entity previousPostId _ = head closePosts
  let hasPrevious = fromSqlKey previousPostId == previousBlogPostId
  let maybeFirstPost = Just (closePosts !! (if hasPrevious then 1 else  0))
  let maybePreviousPost = if hasPrevious then Just (head closePosts) else Nothing
  let adjustNextPostIndex = if hasPrevious then 1 else 0
  let maybeNextPost = if length closePosts >= (2 + adjustNextPostIndex) then Just (closePosts !! (1 + adjustNextPostIndex)) else Nothing
  defaultLayout $ do
    setTitle title
    $(widgetFile "blog/index")
