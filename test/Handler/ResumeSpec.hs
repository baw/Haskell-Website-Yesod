module Handler.ResumeSpec (spec) where

import TestImport

spec :: Spec
spec = withApp $ do
    describe "getResumeR" $ do
      it "has a status of 200" $ do
        get ResumeR
        statusIs 200

      it "has the right content" $ do
        get ResumeR
        htmlAllContent "h3.title" "Résumé"
        htmlAnyContain "p" "Check out my LinkedIn Page!"
