[supervisord]
nodaemon=true

[unix_http_server]
file=/var/run//supervisor.sock
chmod=0700

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run//supervisor.sock

[program:rabbitmq]
priority=10
directory=/tmp
command=/usr/sbin/rabbitmq-server
user=root
autostart=true
autorestart=true
stopsignal=QUIT

[program:redis]
priority=10
directory=/tmp
command=redis-server
user=root
autostart=true
autorestart=true

[program:sensu-server]
priority=20
directory=/tmp
command=/opt/sensu/bin/sensu-server -c /etc/sensu/config.json -d /etc/sensu -e /etc/sensu/extensions -v -l /var/log/sensu/server.log
user=root
startsecs=5
autostart=true
autorestart=true

[program:sensu-api]
priority=30
directory=/tmp
command=/opt/sensu/bin/sensu-api -c /etc/sensu/config.json -d /etc/sensu -e /etc/sensu/extensions -v -l /var/log/sensu/api.log
user=root
startsecs=5
autostart=true
autorestart=true

[program:sensu-client]
priority=40
directory=/tmp
command=/opt/sensu/bin/sensu-client -c /etc/sensu/config.json -d /etc/sensu -e /etc/sensu/extensions -v -l /var/log/sensu/client.log
user=root
autostart=true
autorestart=true

[program:sensu-dashboard]
priority=50
directory=/tmp
command=/opt/sensu/bin/sensu-dashboard -c /etc/sensu/config.json -d /etc/sensu -e /etc/sensu/extensions -v -l /var/log/sensu/dashboard.log
user=root
autostart=true
autorestart=true
