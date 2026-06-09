module Main (main) where

import System.Environment qualified as Base
import System.Process.Environment.OsString qualified as Process

main :: IO ()
main = do
  Base.getArgs >>= p "Base: "
  Process.getArgs >>= p "Process: "
  where
    p h = putStrLn . (h ++) . show
