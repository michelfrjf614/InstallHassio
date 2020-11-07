#!/usr/bin/env bash

set -e

function error { echo -e "[Error] $*"; exit 1; }
function warn  { echo -e "[Warning] $*"; }

echo TESTE

sudo chmod 777 /usr/share/hassio/ssl
cd /usr/share/hassio/ssl

echo "Digite o nome do nome dominio duckdns. Exemplo se for NOME_DO_DNS.duckdns.org informar O NOME_DO_DNS: " 
read dns
echo "o DNS informado foi $dns"

cp /usr/share/hassio/addons/data/core_duckdns/letsencrypt/$_DNS.duckdns.org/chain.pem /usr/share/hassio/ssl


echo "listener 8884 - protocol websockets use:"
echo "cafile /ssl/chain.pem"
echo "certfile /ssl/cert.pem"
echo "keyfile /ssl/privkey.pem"
echo ""

echo "listener 8883 - protocol mqtt use:"
echo "cafile /ssl/chain.pem"
echo "certfile /ssl/cert.crt"
echo "keyfile /ssl/privkey.pem"
echo ""

echo "Extrair .CRT de .PEM: fullchain.PEM ==> cert.CRT"
sudo openssl crl2pkcs7 -nocrl -certfile fullchain.pem | openssl pkcs7 -print_certs -out cert.crt
echo ""


echo "Firmwware use:"
echo "chain.pem     ==> ca.der"
sudo openssl x509 -outform der -in     chain.pem -out ca.der
echo ""

echo "fullchain.pem ==> cert.der"
sudo openssl x509 -outform der -in fullchain.pem -out cert.der
echo ""

echo "privkey.pem   ==> private.der"
sudo openssl x509 -outform der -in   privkey.pem -out private.der
echo ""

#certificate.crt
#cert.csr
#cert.key
#cert.pem


#echo "[Info] Para certificados"
#echo "http://www.steves-internet-guide.com/mosquitto-tls/"
#echo "https://www.youtube.com/watch?v=f3f4h7q6x5g"
#echo "https://www.youtube.com/watch?v=zPT8LFWqazM"
#echo ""
#echo "https://www.sslshopper.com/ssl-converter.html"
#echo ""
