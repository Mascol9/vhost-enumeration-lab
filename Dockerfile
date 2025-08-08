FROM httpd:2.4

# Metadata
LABEL maintainer="your-email@example.com"
LABEL description="VHost Enumeration Lab for testing vhost discovery techniques"
LABEL version="1.0"
LABEL org.opencontainers.image.source="https://github.com/yourusername/vhost-lab"

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./vhosts.conf /usr/local/apache2/conf/extra/vhosts.conf
COPY ./sites/ /usr/local/apache2/htdocs/

# Expose port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1
