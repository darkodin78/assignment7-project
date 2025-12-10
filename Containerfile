FROM fedora:latest

# Install httpd
RUN dnf upgrade -y && dnf install -y httpd

# Create the /structure folder as root with 777 permissions
RUN mkdir -p /structure && chmod 777 /structure

# Create user collin
RUN useradd collin

# Create /structure/sync-work as user sync
RUN mkdir -p /structure/sync-work && chown sync: /structure/sync-work

# Create /structure/nobody-work as user nobody
RUN mkdir -p /structure/nobody-work && chown nobody: /structure/nobody-work

# Create index.html with the required text
RUN echo "Containers are easy!" > /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Set entrypoint to run httpd in foreground
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
