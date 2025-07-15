# WebSSH

DBCA Docker image for the WebSSH application, plus Kubernetes resource
definitions.

Reference: <https://pypi.org/project/webssh/>

## Updates

Update the Dockerfile as appropriate, build and test locally.

```bash
docker image build -t ghcr.io/dbca-wa/webssh .
docker container run --rm --name webssh -t -p 8080:8080 ghcr.io/dbca-wa/webssh
```

Tag the newly-built image as appropriate, push to the container
repository, modify the Kubernetes resource definitions with the newly
tagged image version, and deploy as normal.

```bash\
kubectl -n webssh apply -f uat.yaml --dry-run=client
```
