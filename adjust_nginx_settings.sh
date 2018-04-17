#!/bin/bash
echo "Changeing nginx.conf"
echo "proxypass            => $PROXYPASS"


sed -i  "s#-PROXYPASS-#${PROXYPASS}#g" /etc/nginx/nginx.conf


echo "--------------------------"
echo "changed nginx config:"
cat /etc/nginx/nginx.conf

echo " "
echo "adjusting done"

# Execute the CMD from the Dockerfile
exec "$@"
