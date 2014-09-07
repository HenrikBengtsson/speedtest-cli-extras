@echo off
@rem ##################################################################
@rem # Windows Batch script for launching speedtest-csv via
@rem # bash, cf. MinGW [http://www.mingw.org/]
@rem ##################################################################
@rem # Call the bash script in the same directory as this script
bash %~dp0\speedtest-csv %*
