# piping-server-onion-service-docker-compose
[![CircleCI](https://circleci.com/gh/nwtgck/piping-server-onion-service-docker-compose.svg?style=shield)](https://circleci.com/gh/nwtgck/piping-server-onion-service-docker-compose)

[Piping Server](https://github.com/nwtgck/piping-server) as [Onion Service](https://2019.www.torproject.org/docs/onion-services.html.en)

![Piping on Tor](demo_images/piping_on_tor.gif)

## Run server

Here is how to run Piping Server as Onion Service.

```bash
# Go to this repo
cd <this repo>
# Create SSL certs for docker volume sharing
./create_ssl_certs.sh
# Run the server
docker-compose up
```

## Data Persistence

All data for persistence are under `./docker_volumes`.

## Check host name

You can check server's host name by

```bash
cat docker_volumes/tor_hidden_service/hostname
```

## Access to the server

You can send a file by like the following.

```bash
torsocks curl -T ./mytext.txt http://4ffuycuycuv72tws.onion/mypath1
```

Or you can access to the page like the following on Tor Browser.

![demo1](demo_images/piping_tor_hidden_service.png)

(NOTE: You should replace hostname with yours)

## HTTPS access

`HTTPS` is also available in this docker-compose.

You should add `-k` or `--insecure` to `curl` option.

```bash
torsocks curl -k -T ./mytext.txt https://4ffuycuycuv72tws.onion/mypath1
```
