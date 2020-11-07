#!/usr/bin/env bash

cd /usr/share/hassio/ssl

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
echo "openssl crl2pkcs7 -nocrl -certfile fullchain.pem | openssl pkcs7 -print_certs -out cert.crt"
echo ""


echo "Firmwware use:"
echo "chain.pem     ==> ca.der"
openssl x509 -outform der -in     chain.pem -out ca.der
echo ""

echo "fullchain.pem ==> cert.der"
openssl x509 -outform der -in fullchain.pem -out cert.der
echo ""

echo "privkey.pem   ==> private.der"
openssl x509 -outform der -in   privkey.pem -out private.der
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