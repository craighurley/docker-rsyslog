# docker-rsyslog

Run rsyslog in a container.

## Build

```sh
docker build -t rsyslog .
```

## Run

```sh
docker run --rm -d -v $PWD/log:/var/log -p 514:514 -p 514:514/udp --name rsyslog rsyslog
```

Optional: create aliases for the container:

```sh
alias rsyslog-start='docker run --rm -d -v $PWD/log:/var/log -p 514:514 -p 514:514/udp --name rsyslog rsyslog'
alias rsyslog-stop='docker stop rsyslog'
```

## Testing

```sh
docker run --rm --log-driver syslog --log-opt syslog-address=udp://localhost:514 alpine echo hello from $(date +%Y%m%d%H%M%S)
```
