# oci-mkcert
Container for managing local service PKI

Use this container as a oneshot service to create ephemeral service keys and certs for securing communications with a simple self-signed CA.

Example:

```
docker run --rm -v $(pwd)/certs:/certs -e CERTNAMES="example.com" bcit.io/mkcert
```

Example for creating a Minio certs directory:

```
docker volume create minio-certs
docker run --rm \
    -v minio-certs:/certs \
    -e CERTFILE=public.cert -e KEYFILE=private.key \
    -e CACERTFILE="CAs/rootCA.pem" \
    -e CERTNAMES="s3.example.com" \
    bcit.io/mkcert
```
