# syntax=docker/dockerfile:1
FROM python:3.13
LABEL org.opencontainers.image.authors=asi@dbca.wa.gov.au
LABEL org.opencontainers.image.source=https://github.com/dbca-wa/webssh

# Install WebSSH.
RUN pip install --no-cache-dir webssh==1.6.3

# Create a non-root user to run WebSSH.
ARG UID=10001
ARG GID=10001
RUN groupadd -g ${GID} webssh \
  && useradd --no-create-home --no-log-init --uid ${UID} --gid ${GID} webssh

USER ${UID}
EXPOSE 8080
CMD ["wssh", "--address=0.0.0.0", "--port=8080", "--logging=warning", "--fbidhttp=False"]
