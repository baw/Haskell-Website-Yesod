module Handler.ProjectsSpec (spec) where

import TestImport

spec :: Spec
spec = withApp $ do
    describe "getProjectsR" $ do
        it "returns a 200 status" $ do
          get ProjectsR
          statusIs 200

        it "has the right title" $ do
          get ProjectsR
          htmlAnyContain "h3.title" "Projects"

        it "has projects on it" $ do
          get ProjectsR
          htmlAnyContain "a" "GitHub Repo"

        it "has suggestion for checking back" $ do
          get ProjectsR
          htmlAnyContain "p.moreProjects" "Check back for more projects!"
