# docker-rsyslog

![](https://github.com/craighurley/docker-rsyslog/workflows/Build%20and%20Publish%20to%20Docker%20Hub/badge.svg)

Run rsyslog in a container.

## Run

```sh
docker run --rm -d -v $PWD/log:/var/log -p 514:514 -p 514:514/udp --name rsyslog craighurley/rsyslog
```

Optional: create aliases for the container:

```sh
alias rsyslog-start='docker run --rm -d -v $PWD/log:/var/log -p 514:514 -p 514:514/udp --name rsyslog craighurley/rsyslog'
alias rsyslog-stop='docker stop rsyslog'
```

## Testing

```sh
docker run --rm --log-driver syslog --log-opt syslog-address=udp://localhost:514 alpine echo hello from $(date +%Y%m%d%H%M%S)
```
