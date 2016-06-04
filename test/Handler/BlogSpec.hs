module Handler.BlogSpec (spec) where

import TestImport

spec :: Spec
spec = withApp $ do
    describe "BlogIndexR route" $ do
      it "returns a 200 status" $ do
        get BlogIndexR
        statusIs 200
