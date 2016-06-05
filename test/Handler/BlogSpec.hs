module Handler.BlogSpec (spec) where

import TestImport

spec :: Spec
spec = withApp $ do
    describe "BlogIndexR route" $ do
      it "returns a 200 status" $ do
        get BlogIndexR
        statusIs 200

      describe "header" $ do
        it "has the correct title" $ do
          get BlogIndexR
          htmlAnyContain ".header .titleText" "Brian Weiser"
          htmlAnyContain ".header .titleText" "Blog"

        it "has an image" $ do
          get BlogIndexR
          htmlAnyContain ".header img" ""

      describe "recent posts" $ do
        it "has the correct title" $ do
          get BlogIndexR
          htmlAnyContain ".recent-posts h2" "Recent Posts"
