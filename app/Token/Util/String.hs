module Token.Util.String
  ( replaceAll,
    genSpace,
    padFront,
    padRear,
    padEqual,
    strip,
  )
where

import Data.Char ( isSpace )
import Data.List ( isPrefixOf )
import Token.Util.EagerCollapsible ( dropInfix )

replaceAll :: String -> String -> String -> String
replaceAll (s : str) find replace
  | null str = s : ""
  | find `isPrefixOf` (s : str) = replace ++ replaceAll (dropInfix find (s : str)) find replace
  | otherwise = s : replaceAll str find replace

genSpace :: Int -> String
genSpace space = concat [" " | x <- [1 .. space]]

padFront :: String -> Int -> String
padFront str space = genSpace space ++ str

padRear :: String -> Int -> String
padRear str space = str ++ genSpace space

padEqual :: String -> Int -> String
padEqual str space = padRear (padFront str space) space

strip :: String -> String
strip str = reverse $ dropWhile isSpace $ reverse $ dropWhile isSpace str