{-# LANGUAGE OverloadedStrings #-}

import           Control.Monad.Trans
import           Data.Monoid
import           Hakyll
import           System.FilePath


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "index.md" $ do
        route $ setExtension "html"
        compile $ do
          ctx <- getContextWithSets
          pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" ctx
            >>= relativizeUrls

    match "pages/*.md" $ do
        route $ setExtension "html"
        compile $ do
          content <- pandocCompiler
          saveSnapshot "content" content
          ctx <- getContextWithSets
          loadAndApplyTemplate "templates/default.html" ctx content
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

getContextWithSets = do
    sets <- loadAllSnapshots "pages/set*" "content"
    return $
      listField "sets" defaultContext (return sets) <>
      defaultContext

routePages :: Identifier -> FilePath
routePages i = "pages" </> file <.> "html"
  where
    file = takeBaseName $ toFilePath i

