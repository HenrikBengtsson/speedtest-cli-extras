@echo off
@rem ##################################################################
@rem # Windows Batch script for launching speedtest-csv via
@rem # bash, cf. MinGW [http://www.mingw.org/]
@rem ##################################################################
@rem # Temporarily add batch script directory to the front of PATH,
@rem # before calling bash script. This avoid having to have the
@rem # bash script on the search PATH.
set PATH_ORG=%PATH%
set PATH_BIN=%~dp0
set PATH_TMP=%PATH_BIN%;%PATH%
set PATH=%PATH_TMP%
bash --login -c "speedtest-csv %*"
set PATH=%PATH_ORG%
