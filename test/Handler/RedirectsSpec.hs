module Handler.RedirectsSpec (spec) where

import TestImport

spec :: Spec
spec = withApp $ do

    describe "Redirects" $ do
      it "redirects asteroids" $ do
        get AsteroidsR
        statusIs 301

      it "redirects community chat" $ do
        get CommunityChatR
        statusIs 301
