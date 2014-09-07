@echo off
@rem ##################################################################
@rem # Windows Batch script for launching speedtest-csv via
@rem # bash, cf. MinGW [http://www.mingw.org/]
@rem ##################################################################
@rem # Temporarily add Batch script directory to the front of PATH,
@rem # before calling bash script. This avoid having to have the
@rem # bash script on the search PATH.
set PATH_ORG=%PATH%
set PATH_TMP=%~dp0;%PATH%
rem set PATH=%PATH_TMP%
bash --login -c "speedtest-csv %*"
set PATH=%PATH_ORG%

