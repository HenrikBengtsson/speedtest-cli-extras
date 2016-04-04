# speedtest-cli-extras

The [speedtest-cli-extras] repository contains tools that enhance the
[speedtest-cli] command-line interface to [speedtest.net] for
benchmarking an internet connection.

## Requirements
* The `speedtest-csv` tool requires Bash (just like `speedtest-cli`).
* Windows users: The MinGW project's [MSYS] package is an
straightforward way to get Bash on Windows.  Note, there is a
`speedtest-csv.bat` Windows Batch wrapper script that calls the bash
script for you.  In other words, if you can `speedtest-csv` at the
_Windows_ command prompt, it will work just as if you called it from
Bash.


## speedtest-csv
The `speedtest-csv` tool calls `speedtest-cli`, captures its
multi-line output, reformats it, adds time stamps, and outputs
the benchmark statistics on a _single_ well formatted line, e.g.
```sh
$ speedtest-csv --standardize --sep '\t'
2016-04-04 09:24:31	2016-04-04 09:24:31	Comcast Cable	24.130.241.190	Monkey Brains (San Francisco, CA)	21.36 km	17.673 ms	5.32 Mbits/s		
```

### Collecting statistics over time
By running the above on a regular basis (e.g. once an hour) and
appending the output to a TAB-delimited file one can gather statistics
over time.  To add meaningful column names to the top of this file,
start off by:
```sh
$ speedtest-csv --header --sep '\t' > speedtest_stats.tsv
# At 00:00 UTC
$ speedtest-csv --standardize --sep '\t' >> speedtest_stats.tsv
# At 01:00 UTC
$ speedtest-csv --standardize --sep '\t' >> speedtest_stats.tsv
# ...

$ less speedtest_stats.tsv
start	stop	from	from_ip	server	server_dist	server_ping	download	upload	share_url
2016-04-04 08:00:01	2016-04-04 08:01:01	Comcast Cable	24.130.241.190	Fastmetrics Inc. (San Francisco, CA)	20.46 km	18.168 ms	4.88 Mbit/s	1.34 Mbit/s	http://www.speedtest.net/result/5224137223.png
2016-04-04 09:00:02	2016-04-04 09:00:42	Comcast Cable	24.130.241.190	Monkey Brains (San Francisco, CA)	21.36 km	16.723 ms	3.40 Mbit/s	0.21 Mbit/s	http://www.speedtest.net/result/5224152283.png
[...]
```

If you're on Linux or OS X, you can use [Cron] jobs to automate the
above.


### Usage
```sh
$ speedtest-csv --help
Usage:
 speedtest-csv [options]

Options:
 --debug        Output extra debug information
 --header       Display field names (only)
 --help         This help
 --last         Use most recent stats, iff available
 --quote <str>  Use <str> as quotation mark
 --sep <str>    Use <str> as field separator
 --standardize  Standardize units and number formats
 --version      Display version

Example:
 speedtest-csv --standardize --sep '\t'

Copyright: 2014-2016 Henrik Bengtsson
License: GPL (>= 2.1) [http://www.gnu.org/licenses/gpl.html]
```


[speedtest-cli-extras]: https://github.com/HenrikBengtsson/speedtest-cli-extras
[speedtest-cli]: https://github.com/sivel/speedtest-cli
[speedtest.net]: http://www.speedtest.net/
[MSYS]: http://www.mingw.org/wiki/msys
[Cron]: https://www.wikipedia.org/wiki/Cron
