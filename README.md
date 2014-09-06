# speedtest-cli-extras

This repository contains tools that enhance the [speedtest-cli] command-line interface to [speedtest.net].

## speedtest-csv

The `speedtest-csv` bash script calls `speedtest-cli`, captures its output and reformats it to a single line with values separated by _semicolons_, e.g.
```
$ speedtest-csv
2014-09-06 10:07:51;2014-09-06 10:09:31;Comcast Cable;73.162.87.38;AT&T (San Francisco, CA);20.22 km;24.536 ms;44.25 Mbits/s;4.93 Mbits/s;http://www.speedtest.net/result/3741180214.png
```
To generate column names, do
```
$ speedtest-csv --header
start;stop;from;from_ip;server;server_dist;server_ping;download;upload;share_url
```

[speedtest-cli]: https://github.com/sivel/speedtest-cli
[speedtest.net]: http://www.speedtest.net/
