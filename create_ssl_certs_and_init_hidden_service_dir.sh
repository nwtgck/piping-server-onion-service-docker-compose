#! /bin/sh -x

TOR_HIDDEN_SERVICE_PATH=./docker_volumes/tor_hidden_service
SSL_CERTS_PATH=./docker_volumes/ssl_certs

if [ ! -e "$SSL_CERTS_PATH/server.crt" ]; then
  # Make SSL certificates
  mkdir -p $SSL_CERTS_PATH
  openssl genrsa 2024 > $SSL_CERTS_PATH/server.key
  openssl req -new -key $SSL_CERTS_PATH/server.key -subj "/C=EN" > $SSL_CERTS_PATH/server.csr
  openssl x509 -req -days 3650 -signkey $SSL_CERTS_PATH/server.key < $SSL_CERTS_PATH/server.csr > $SSL_CERTS_PATH/server.crt
fi

# Initialize "tor_hidden_service" for docker volume sharing
mkdir -p $TOR_HIDDEN_SERVICE_PATH
chmod 700 $TOR_HIDDEN_SERVICE_PATH
