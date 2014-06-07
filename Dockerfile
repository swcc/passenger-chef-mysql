FROM swcc/passenger-chef:latest
# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN apt-get -y update

# Install mysqlclient-dev libs
RUN apt-get install -y libmysqlclient-dev

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

