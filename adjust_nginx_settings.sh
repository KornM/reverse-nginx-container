#!/bin/bash
echo "Changeing nginx.conf"
echo "proxypass            => $PROXYPASS"
echo "httpverbs            => $HTTPVERBS"


sed -i  "s#-PROXYPASS-#${PROXYPASS}#g" /etc/nginx/nginx.conf

if [ ! -z "${USERNAME}" ] && [ ! -z "${PASSWORD}" ]; then
  echo   "${USERNAME}:${PASSWORD}" > /etc/nginx/.htpass
else
  sed -i "/auth/d" /etc/nginx/nginx.conf
fi

if [ ! -z "${HTTPVERBS}" ]; then
  HEADERCONFIG="add_header Allow \"${HTTPVERBS}\" always; \
  if ( \$request_method !~ ^(${HTTPVERBS})$ ) { \
  return 405; \
  }"
  sed -i "s#-HTTPVERBS-#${HEADERCONFIG}#g"   /etc/nginx/nginx.conf
else
  sed -i "s#-HTTPVERBS-#${HTTPVERBS}#g"   /etc/nginx/nginx.conf
fi


echo "--------------------------"
echo "changed nginx config:"
cat /etc/nginx/nginx.conf

echo " "
echo "adjusting done"

# Execute the CMD from the Dockerfile
exec "$@"
