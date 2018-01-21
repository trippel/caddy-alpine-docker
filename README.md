# caddy-alpine-docker
Caddy server docker image based on Alpine.


## Usage

```shell
docker run -d -p 80:80 -p 443:443 -v ./Caddyfile:/Caddyfile -v ./www:/var/www --name=some_name trippel/caddy-alpine
```

If intend to use Let's Encrypt you should mount a volume to /root/.caddy

A docker-compose file could look like this:

``` YAML
caddy:
  image: trippel/caddy-alpine
  ports:
    - 80:80
    - 443:443
  volumes:
    - ./Caddyfile:/Caddyfile
    - ./caddy:/root/.caddy
    - ./www:/var/www
  restart: always
```
