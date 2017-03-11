# Defines Docker image suitable for testing cookbooks on CentOS 7.
#
# This handles a number of idiosyncrasies with systemd so it can be
# run as the root process of the container, making it behave like a
# normal VM but without the overhead.

FROM centos:centos7

RUN curl -L https://omnitruck.chef.io/install.sh | bash
