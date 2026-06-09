# get-args-test

Tests `base` and `process` `getArgs`.

## Results

Results from running `main` on CI:

```haskell
import System.Environment qualified as Base
import System.Process.Environment.OsString qualified as Process

main :: IO ()
main = do
  Base.getArgs >>= p "Base: "
  Process.getArgs >>= p "Process: "
  where
    p h = putStrLn . (h ++) . show
```

### Osx

```
Base: ["arg1","arg2"]
Process: ["arg1","arg2"]
```

### Ubuntu

```
Base: ["arg1","arg2"]
Process: ["arg1","arg2"]
```

### Windows

```
Base: ["arg1","arg2"]
Process: ["D:\\a\\get-args-test\\get-args-test\\dist-newstyle\\build\\x86_64-windows\\ghc-9.14.1\\get-args-test-0.1\\x\\get-args-test\\opt\\build\\get-args-test\\get-args-test","arg1","arg2"]
```
