{-# LANGUAGE CPP #-}

module Main (main) where

import Control.Monad ((<=<))
import Data.List qualified as L
import System.Environment qualified as Base
import System.OsString qualified as OsStr
import System.Process.Environment.OsString qualified as Process

#if WINDOWS
import System.OsString.Internal.Types (OsString(OsString))
import System.Win32.WindowsString.Console qualified as Windows
#endif

main :: IO ()
main = do
  Base.getArgs >>= p pure "Base: "
  Process.getArgs >>= p OsStr.decodeUtf "Process: "
#if WINDOWS
  let q = OsStr.decodeUtf . OsString
  Windows.getArgs >>= p q "Win32 getArgs: "
  Windows.getArgsNoExe >>= p q "Win32 getArgsNoExe: "
  Windows.getArgsStripped >>= p q "Win32 getArgsStripped: "
#endif
  where
    p :: (a -> IO String) -> String -> [a] -> IO ()
    p toStr h = (putStrLn . (h ++) . L.intercalate ", ") <=< traverse toStr
