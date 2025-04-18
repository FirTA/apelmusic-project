#!/bin/sh
# Set default if not provided
BACKEND_API_URL=${BACKEND_API_URL:-http://apelmusic-api-eec4dkbcezejfhhz.indonesiacentral-01.azurewebsites.net}

# Replace in the nginx config
sed -i "s|__BACKEND_API_URL__|${BACKEND_API_URL}|g" /etc/nginx/conf.d/default.conf

# Start nginx
exec nginx -g 'daemon off;'