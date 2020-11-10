#!/usr/bin/env bash

info "Digite o nome do nome dominio no duckdns. Exemplo se for NOME_DO_DNS.duckdns.org informar o NOME_DO_DNS:"
read answer < /dev/tty

sudo cp /usr/share/hassio/addons/data/core_duckdns/letsencrypt/"$answer".duckdns.org/chain.pem /usr/share/hassio/ssl
# sudo cp /usr/share/hassio/addons/data/core_duckdns/letsencrypt/testexpto.duckdns.org/chain.pem /usr/share/hassio/ssl
# sudo cp /usr/share/hassio/addons/data/core_duckdns/letsencrypt/testexpto.duckdns.org/fullchain.pem /usr/share/hassio/ssl
# sudo cp /usr/share/hassio/addons/data/core_duckdns/letsencrypt/testexpto.duckdns.org/privkey.pem /usr/share/hassio/ssl

cd /usr/share/hassio/ssl


echo "Nós precisamos dos certificados para as portas a seguir:"
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

echo "#####################################################################################"

echo "Extrair .CRT de .PEM:   fullchain.PEM ==> cert.crt"
sudo  openssl crl2pkcs7 -nocrl -certfile fullchain.pem | openssl pkcs7 -print_certs -out cert.crt
echo ""


echo "Extrair cert.Pem de fullcert.PEM:   fullchain.PEM ==> cert.crt"

echo ""


echo "Firmwware use:"
echo "Extrair .DER de .PEM:  chain.pem     ==> ca.der"
 sudo openssl x509 -outform DER -in chain.pem -out ca.der
echo ""

echo "Extrair .DER de .PEM:  fullchain.pem ==> cert.der"
 sudo openssl x509 -outform DER -in fullchain.pem -out cert.der
echo ""

echo "Extrair .DER de .PEM:  privkey.pem   ==> private.der"
 sudo openssl rsa  -outform DER -in privkey.pem -out private.der
echo ""
echo ""
echo "Certificado gerados"

#certificate.crt
#cert.key
#cert.pem
