FROM            alpine:3.11

RUN             apk update \
                && apk add --no-cache \
                    rsyslog

RUN             echo -e 'module(load="imudp")\n\
input(type="imudp" port="514")\n\
module(load="imtcp")\n\
input(type="imtcp" port="514")\n\
global(net.enableDNS="off")\n\
$template RemoteStore, "/var/log/remote/%$now%/%$hour%.log"\n\
:source, !isequal, "localhost" -?RemoteStore\n\
:source, isequal, "last" ~' > /etc/rsyslog.conf

ENTRYPOINT      ["rsyslogd", "-n"]
