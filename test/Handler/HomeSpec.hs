module Handler.HomeSpec (spec) where

import TestImport

spec :: Spec
spec = withApp $ do
    describe "HomeR route" $ do
      it "returns a 200 status" $ do
        get HomeR
        statusIs 200

      it "has the right content" $ do
        get HomeR
        htmlAnyContain "h1" "Brian Weiser"
        htmlAnyContain "h2" "Software Engineer"

      describe "useful links" $ do
        it "has a link to projects" $ do
          get HomeR
          htmlAnyContain "a" "Projects"

        it "has a link to resume" $ do
          get HomeR
          htmlAnyContain "a" "Résumé"

      describe "social profile links" $ do
        it "has an email link" $ do
          get HomeR
          htmlAnyContain "a.footerLinkImg" "Contact"

        it "has my LinkedIn profile link" $ do
          get HomeR
          htmlAnyContain "a.footerLinkImg" "LinkedIn"

        it "has my GitHub profile link" $ do
          get HomeR
          htmlAnyContain "a.footerLinkImg" "GitHub"
