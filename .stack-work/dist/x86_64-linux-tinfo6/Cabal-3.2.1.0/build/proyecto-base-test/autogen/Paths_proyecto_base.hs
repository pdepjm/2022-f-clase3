{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_proyecto_base (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/diana/Documentos/PdeP/2022-f-clase3/.stack-work/install/x86_64-linux-tinfo6/a154028f1c89aab12fe077682b48836bf5e28383bf06383624d12a792ad7f67d/8.10.7/bin"
libdir     = "/home/diana/Documentos/PdeP/2022-f-clase3/.stack-work/install/x86_64-linux-tinfo6/a154028f1c89aab12fe077682b48836bf5e28383bf06383624d12a792ad7f67d/8.10.7/lib/x86_64-linux-ghc-8.10.7/proyecto-base-0.1.0.0-3WK32Y8WdxoGO626zWRRLc-proyecto-base-test"
dynlibdir  = "/home/diana/Documentos/PdeP/2022-f-clase3/.stack-work/install/x86_64-linux-tinfo6/a154028f1c89aab12fe077682b48836bf5e28383bf06383624d12a792ad7f67d/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/diana/Documentos/PdeP/2022-f-clase3/.stack-work/install/x86_64-linux-tinfo6/a154028f1c89aab12fe077682b48836bf5e28383bf06383624d12a792ad7f67d/8.10.7/share/x86_64-linux-ghc-8.10.7/proyecto-base-0.1.0.0"
libexecdir = "/home/diana/Documentos/PdeP/2022-f-clase3/.stack-work/install/x86_64-linux-tinfo6/a154028f1c89aab12fe077682b48836bf5e28383bf06383624d12a792ad7f67d/8.10.7/libexec/x86_64-linux-ghc-8.10.7/proyecto-base-0.1.0.0"
sysconfdir = "/home/diana/Documentos/PdeP/2022-f-clase3/.stack-work/install/x86_64-linux-tinfo6/a154028f1c89aab12fe077682b48836bf5e28383bf06383624d12a792ad7f67d/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "proyecto_base_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "proyecto_base_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "proyecto_base_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "proyecto_base_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "proyecto_base_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "proyecto_base_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
