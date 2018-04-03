FROM ubuntu:16.04

# Mantainer


# Install Dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    python-software-properties \
    software-properties-common \
    telnet \
    && apt-get clean

# grab oracle java (auto accept licence)
RUN add-apt-repository -y ppa:webupd8team/java \
    && apt-get update \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
    && apt-get install -y oracle-java8-installer

RUN apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Set Env variables

# Run provisioning data and preprocessing

# Switch to Ubuntu user

# Execute bash script.