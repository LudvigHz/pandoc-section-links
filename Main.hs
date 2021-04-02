#!/usr/bin/env runhaskell
-- add-links.hs

import qualified Data.Text                     as T
import           Text.Pandoc.Definition
import           Text.Pandoc.JSON

main :: IO ()

main = toJSONFilter sectionLinks

sectionLinks :: Block -> Block

linkAttr = (T.pack "classes", [T.pack "section-link"], [])

sectionLinks h@(Header n (id, classes, namevals) xs) = Header
  n
  (id, classes, namevals)
  (xs ++ [Link linkAttr [Str $ T.pack "¶"] (T.pack "#" <> id, id)])

sectionLinks x = x
