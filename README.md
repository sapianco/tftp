# tftp
Docekr Alpine Linux TFTP server implementation 

# Build And Push to docker registry

``` bash
version=0.1.1
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --build-arg VCS_REF=$(git rev-parse --short HEAD)  -t sapian/tftp:latest -t sapian/tftp:${version} --build-arg VERSION=${version} .
```

# build multiarch and push

``` bash
version=0.1.1
docker buildx build --push \
    --platform linux/arm64/v8,linux/amd64,linux/arm/v7 \
    --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    --build-arg VCS_REF=$(git rev-parse --short HEAD) \
    --tag quay.io/sapian/tftp:latest \
    --tag quay.io/sapian/tftp:${version} \
    .
```