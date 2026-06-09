{-# LANGUAGE CPP #-}

module Main (main) where

import System.Environment qualified as Base
import System.Process.Environment.OsString qualified as Process

#if WINDOWS
import System.Win32.Console qualified as Windows
#endif

main :: IO ()
main = do
  Base.getArgs >>= p "Base: "
  Process.getArgs >>= p "Process: "
#if WINDOWS
  Windows.getArgs >>= p "Win32 getArgs: "
  Windows.getArgsNoExe >>= p "Win32 getArgsNoExe: "
#endif
  where
    p h = putStrLn . (h ++) . show
