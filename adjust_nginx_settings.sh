#!/bin/bash
echo "Changeing nginx.conf"
echo "proxypass            => $PROXYPASS"



sed -i  "s#-PROXYPASS-#${PROXYPASS}#g" /etc/nginx/nginx.conf

if [ ! -z "${USERNAME}" ] && [ ! -z "${PASSWORD}" ]; then
  echo   "${USERNAME}:${PASSWORD}" > /etc/nginx/.htpass
else
  sed -i "/auth/d" /etc/nginx/nginx.conf
fi

echo "--------------------------"
echo "changed nginx config:"
cat /etc/nginx/nginx.conf

echo " "
echo "adjusting done"

# Execute the CMD from the Dockerfile
exec "$@"
