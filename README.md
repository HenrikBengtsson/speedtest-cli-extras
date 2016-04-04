# speedtest-cli-extras

The [speedtest-cli-extras] repository contains tools that enhance the
`[speedtest-cli]` command-line interface to [speedtest.net] for
benchmarking an internet connection.

## Requirements
* The `speedtest-csv` tools requires Bash (just like `[speedtest-cli]`).
* Windows users: The MinGW project's [MSYS] package is an
straightforward way to get Bash on Windows.  Note, there is a
`speedtest-csv.bat` Windows Batch wrapper script that calls the bash
script for you.  In other words, if you can `speedtest-csv` at the
_Windows_ command prompt, it will work just as if you called it from
Bash.


using Bash,

## speedtest-csv
The `speedtest-csv` tool calls `speedtest-cli`, captures its
multi-line output, reformats it, adds time stamps, and outputs
the benchmark statistics on a _single_ well formatted line, e.g.
```
$ speedtest-csv --standardize --sep '\t'
2016-04-04 09:24:31	2016-04-04 09:24:31	Comcast Cable	24.130.241.190	Monkey Brains (San Francisco, CA)	21.36 km	17.673 ms	5.32 Mbits/s		
```

By running the above on a regular basis (e.g. once an hour) and
appending the output to a TAB-delimited file one can gather statistics
over time.  To add meaningful column names to the top of this file,
start off by:
```
$ speedtest-csv --header --sep '\t' > speedtest_stats.tsv
$ speedtest-csv --standardize --sep '\t' > speedtest_stats.tsv
$ speedtest-csv --standardize --sep '\t' > speedtest_stats.tsv
$ less speedtest_stats.tsv
```

Together with
To generate column names, do

## Windows users

[speedtest-cli-extras]: https://github.com/HenrikBengtsson/speedtest-cli-extras
[speedtest-cli]: https://github.com/sivel/speedtest-cli
[speedtest.net]: http://www.speedtest.net/
[MSYS]: http://www.mingw.org/wiki/msys
