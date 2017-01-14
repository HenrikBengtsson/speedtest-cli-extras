# speedtest-cli-extras

The [speedtest-cli-extras] repository contains tools that enhance the
[speedtest-cli] command-line interface to [speedtest.net] for benchmarking an
internet connection.

## Requirements

* The `speedtest-csv` tool requires:
  - a Bash shell or be called via `bash speedtest-csv`.
  - [`speedtest-cli`](https://github.com/sivel/speedtest-cli) which in turn
    requires Python.
  - that `speedtest-cli` is on the `PATH` or in the same directory as
	`speedtest-csv`.

Windows users: The MinGW project's [MSYS] package is an straightforward way to
get Bash on Windows.  Note, there is a `speedtest-csv.bat` Windows Batch wrapper
script that calls the Bash script for you.  In other words, if you call
`speedtest-csv` at the _Windows_ command prompt, it will work just as if you
called it from Bash.  Regardless, you do need Bash also on Windows.


## speedtest-csv
The `speedtest-csv` tool calls `speedtest-cli`, captures its multi-line output,
reformats it, adds time stamps, and outputs the benchmark statistics on a
_single_ well formatted line, e.g.
```sh
$ speedtest-csv --header
start	stop	from	from_ip	server	server_dist (km)	server_ping (ms)	download (Mbit/s)	upload (Mbit/s)	share_url
$ speedtest-csv
2016-04-04 16:35:01	2016-04-04 16:35:51	Comcast Cable	24.130.241.190	Fastmetrics Inc. (San Francisco, CA)	20.46	18.168	4.88	1.34	http://www.speedtest.net/result/5224137223.png
```

### Collecting statistics over time
By running the above on a regular basis (e.g. once an hour) and appending the
output to a TAB-delimited file one can gather statistics over time.  To add
meaningful column names to the top of this file, start off by adding a header:
```sh
$ speedtest-csv --header > speedtest_stats.tsv
# At 00:00 UTC
$ speedtest-csv >> speedtest_stats.tsv
# At 01:00 UTC
$ speedtest-csv --sep '\t' --standardize >> speedtest_stats.tsv
# ...

$ less speedtest_stats.tsv
start	stop	from	from_ip	server	server_dist	server_ping	download	upload	share_url
2016-04-04 08:00:01	2016-04-04 08:01:01	Comcast Cable	24.130.241.190	Fastmetrics Inc. (San Francisco, CA)	20.46	18.168	4.88	1.34	http://www.speedtest.net/result/5224137223.png
2016-04-04 09:00:02	2016-04-04 09:00:42	Comcast Cable	24.130.241.190	Monkey Brains (San Francisco, CA)	21.36	16.723	3.40	0.21	http://www.speedtest.net/result/5224152283.png
[...]
```

If you're on Linux or macOS, you can use [Cron] jobs to automate the above.


### Usage
```sh
$ speedtest-csv --help
Usage:
 speedtest-csv [options]

Options:
 --debug           Output extra debug information
 --header          Display field names (only)
 --help            This help
 --last            Use most recent stats, if available
                   (avoids calling `speedtest-cli`)
 --quote <str>     Quote fields using <str> (default: none)
 --sep <str>       Separate fields using <str> (default '\t')
 --share           Generate and provide a URL to the speedtest.net
                   share results image (default)
 --no-share        Disable --share
 --header-units    Units are in header (default)
 --no-header-units Units are in the values
 --standardize     Standardize units and number formats (default)
 --no-standardize  Disable --standardize
 --version         Display version

Any other options are passed to speedtest-cli as is.

Example:
 speedtest-csv --header
 speedtest-csv

 # Defaults in speedtest-csv (<= 1.3.0):
 speedtest-csv --sep ';' --no-standardize --no-header-units

Installed dependencies:
 speedtest-cli 1.0.1 (https://github.com/sivel/speedtest-cli)
 python 2.7.12

Copyright: 2014-2017 Henrik Bengtsson
License: GPL (>= 2.1) (https://www.gnu.org/licenses/gpl.html)
```


[speedtest-cli-extras]: https://github.com/HenrikBengtsson/speedtest-cli-extras
[speedtest-cli]: https://github.com/sivel/speedtest-cli
[speedtest.net]: http://www.speedtest.net/
[MSYS]: http://www.mingw.org/wiki/msys
[Cron]: https://www.wikipedia.org/wiki/Cron
