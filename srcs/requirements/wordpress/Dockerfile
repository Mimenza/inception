FROM debian:bullseye

# Update the package index to get the latest package information
RUN apt -y update

# Upgrade installed packages to their latest versions
RUN apt -y upgrade

# Install necessary packages:
# - curl: for making HTTP requests, often useful in scripts and testing
# - mariadb-client: for interacting with a remote MariaDB database server
# - netcat: a networking utility for testing connections
# - php: the main PHP package
# - php-mysql: PHP extension for MySQL/MariaDB database interaction
# - php7.4-fpm: FastCGI Process Manager for handling PHP requests
RUN apt install -y \
	curl \
	mariadb-client \
	netcat \
	php \
	php-mysql \
	php7.4-fpm

# Copy the WordPress configuration script to the root directory
COPY ./conf/wp_conf.sh /

# Grant execution permissions to the configuration script
RUN chmod +x wp_conf.sh

# Create the WordPress root directory
RUN mkdir -p /var/www/wordpress

# Expose port 9000 for FastCGI requests
EXPOSE 9000

# Run the configuration script as the container’s entry point
ENTRYPOINT ["./wp_conf.sh"]
