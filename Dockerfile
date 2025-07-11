# This is a placeholder Dockerfile to ensure Elestio builds the application
# The actual build is handled by docker-compose.elestio.yaml

FROM nginx:alpine

# Copy the nginx configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copy the build output
COPY --from=frontend /app/build /usr/share/nginx/html

# Copy the static files
COPY --from=backend /app/static /usr/share/nginx/static

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
