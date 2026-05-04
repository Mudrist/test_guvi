# Use a lightweight Alpine-based Nginx image
FROM nginx:alpine

# Remove default configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom configuration file
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Copy static assets
COPY ./html /usr/share/nginx/html

EXPOSE 80
