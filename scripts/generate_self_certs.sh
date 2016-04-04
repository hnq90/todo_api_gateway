BASE_DIR=$(dirname $0)/..

openssl genrsa -out $BASE_DIR/server.key 4096
openssl req -new -batch -key $BASE_DIR/server.key -out $BASE_DIR/server.csr
openssl x509 -req -days 365000 -in $BASE_DIR/server.csr -signkey $BASE_DIR/server.key -out $BASE_DIR/server.crt
