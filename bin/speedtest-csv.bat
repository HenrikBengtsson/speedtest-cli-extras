@echo off
@rem ##################################################################
@rem # Windows Batch script for launching speedtest-csv via
@rem # bash, cf. MinGW [http://www.mingw.org/]
@rem ##################################################################

@rem # Get the directory of this script
for /f %%i in ("%0") do set PWD=%%~dpi

@rem # Call the bash script in the same directory
bash %PWD%\speedtest-csv %*
