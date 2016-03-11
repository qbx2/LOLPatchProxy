# Configurations
### crontab
`*/10 * * * * cd /etc/nginx/html; ./auto_update.bash >> auto_update.log`

### nginx.conf
```
worker_processes    1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  text/plain;

    # disable auto-update
    server {
        listen       15310;
        server_name  localhost;

        location / {
            root        html;
            try_files   $uri $uri/ @cdn;
        }

        location @cdn {
            proxy_pass  http://l3cdn.riotgames.com;
            proxy_connect_timeout 60s;
            proxy_read_timeout 60s;
        }
    }

    # enable auto-update
    server {
        listen      15320;
        server_name localhost;

        rewrite      ^(.*)_KR$                                             $1_NA;
        rewrite      ^(.*)_ko_kr/(((?!files|releasemanifest).)*)$          $1_en_us/$2;
        rewrite      ^(.*)_kr/(((?!files|releasemanifest).)*)$             $1_na/$2;

        location / {
            proxy_pass  http://l3cdn.riotgames.com;
            proxy_connect_timeout 60s;
            proxy_read_timeout 60s;
        }
    }
}
```
