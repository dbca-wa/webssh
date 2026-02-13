# syntax=docker/dockerfile:1
FROM dhi.io/python:3.13-debian13-dev
LABEL org.opencontainers.image.authors=asi@dbca.wa.gov.au
LABEL org.opencontainers.image.source=https://github.com/dbca-wa/webssh

# Install WebSSH.
RUN pip install --no-cache-dir webssh==1.6.3

# Run project as the nonroot user
USER nonroot
EXPOSE 8080
CMD ["wssh", "--address=0.0.0.0", "--port=8080", "--logging=warning", "--fbidhttp=False"]
