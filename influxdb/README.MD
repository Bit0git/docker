## influxdb

influxdb,telegraf,chronograf

https://portal.influxdata.com/downloads


### influxdb

```
docker network create influx
```



```
docker run --name influxdb -m 300m --rm -it -p 8086:8086 --net influx suconghou/influxdb
```



```
docker run --name influxdb \
-m 300m \
--restart always \
-d \
-p 127.0.0.1:8086:8086 \
--net influx \
suconghou/influxdb
```

### telegraf

```
[global_tags]
    dc="hw"
[agent]
    interval = "10s"
    round_interval = true
    metric_batch_size = 1000
    metric_buffer_limit = 10000
    collection_jitter = "0s"
    flush_interval = "10s"
    flush_jitter = "0s"
    precision = ""
    debug = false
    quiet = false
    logfile = ""
    hostname = "hw-209"
    omit_hostname = false
[[outputs.influxdb]]
    urls = ["http://172.16.0.148:8086"]
[[inputs.docker_log]]
    endpoint = "unix:///var/run/docker.sock"

[[inputs.cpu]]
    percpu = true
    totalcpu = true
    collect_cpu_time = false
    report_active = false
[[inputs.disk]]
    ignore_fs = ["tmpfs", "devtmpfs", "devfs", "overlay", "aufs", "squashfs"]
[[inputs.kernel]]
[[inputs.mem]]
[[inputs.processes]]
[[inputs.swap]]
[[inputs.system]]
```


2018-12-25T09:05:49Z I! Starting Telegraf 
2018-12-25T09:05:49Z I! Loaded inputs: inputs.mem inputs.processes inputs.swap inputs.system inputs.cpu inputs.disk inputs.diskio inputs.kernel
2018-12-25T09:05:49Z I! Loaded aggregators: 
2018-12-25T09:05:49Z I! Loaded processors: 
2018-12-25T09:05:49Z I! Loaded outputs: influxdb
2018-12-25T09:05:49Z I! Tags enabled: host=will-image.novalocal
2018-12-25T09:05:49Z I! [agent] Config: Interval:10s, Quiet:false, Hostname:"will-image.novalocal", Flush Interval:10s


### chronograf

```
docker run --name chronograf -m 100m --rm -it -p 8888:8888 suconghou/influxdb:chronograf
```

```
docker run --name chronograf \
-m 100m \
--restart always \
-d \
-p 127.0.0.1:8888:8888 \
--net influx \
suconghou/influxdb:chronograf
```


## dockerfile

https://github.com/suconghou/docker/tree/master/influxdb


docker image  https://hub.docker.com/r/suconghou/influxdb/

