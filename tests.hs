#!/usr/bin/env runhaskell

import Text.Pandoc
import System.Exit

rstCorrect :: String -> Bool
rstCorrect s = writeRST def (readRST def s) == s

main = do
  statute <- readFile "statut.rst"
  if rstCorrect statute
    then do putStrLn "OK"
            exitSuccess
    else do putStrLn "FAIL"
            exitFailure
