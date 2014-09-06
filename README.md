# speedtest-cli-extras

This repository contains tools that enhance the [speedtest-cli] command-line interface to [speedtest.net].

## speedtest-csv

The `speedtest-csv` bash script runs `speedtest-cli` and outputs the results on a single line where the values are separated by semicolons, e.g.
```
$ speedtest-csv
2014-09-06 10:02:59;2014-09-06 10:03:30;Comcast Cable;73.162.87.38;SingTel (Palo Alto, CA);56.44 km;15.705 ms;50.00 Mbits/s;5.72 Mbits/s;
```
To generate column names, do
```
$ speedtest-csv --header
start;stop;from;from_ip;server;server_dist;server_ping;download;upload;share_url
```

[speedtest-cli]: https://github.com/sivel/speedtest-cli
[speedtest.net]: http://www.speedtest.net/
