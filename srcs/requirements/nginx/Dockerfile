FROM debian:bullseye

# Update the package index to ensure we have the latest package information
RUN apt -y update

# Upgrade installed packages to their latest versions
RUN apt -y upgrade

# Install Nginx and OpenSSL to enable web server functionality and SSL certificate generation
RUN apt install -y nginx openssl

# Create the directory for storing SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate with OpenSSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-out /etc/ssl/nginx-selfsigned.pem \
	-keyout /etc/ssl/nginx-selfsigned.key \
	-subj "/C=ES/ST=PO/L=VG/O=42/OU=42/CN=emimenza-m.fr/UID=emimenza-m"

# Copy the Nginx configuration file to the container
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 443 to allow HTTPS connections
EXPOSE 443

# Start Nginx in the foreground to keep the container running
ENTRYPOINT ["nginx", "-g", "daemon off;"]
