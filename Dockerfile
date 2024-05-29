# syntax=docker/dockerfile:1
FROM python:3.12.3-slim
MAINTAINER asi@dbca.wa.gov.au
LABEL org.opencontainers.image.source https://github.com/dbca-wa/webssh

# Install system updates.
RUN apt-get update -y && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# Install WebSSH.
ARG WEBSSH_VERSION=1.6.2
RUN pip install webssh==${WEBSSH_VERSION}

# Create a non-root user to run WebSSH.
ARG UID=10001
ARG GID=10001
RUN groupadd -g "${GID}" webssh \
  && useradd --no-create-home --no-log-init --uid "${UID}" --gid "${GID}" webssh

USER ${UID}
EXPOSE 8080
CMD ["wssh", "--address=0.0.0.0", "--port=8080", "--logging=warning"]
