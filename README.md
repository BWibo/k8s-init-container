
<h1 align="center">k8s-init-container</h1>

<p align="center">
    <em>Alpine linux with some basic tools often required by k8s init containers</em>
</p>

## :inbox_tray: Included tools

* bash
* curl
* wget
* git
* p7zip

## :rocket: Usage

### Get the image

The image is available from [Dockerhub](https://hub.docker.com/repository/docker/bwibo/k8s-init-container):

```shell
docker pull bwibo/k8s-init-container
```

### Example interactive mode

```shell
docker run -i -t --rm --name init --entrypoint bash bwibo/k8s-init-container
```

### Example execute a command

```shell
docker run -i -t --rm --name init bwibo/k8s-init-container 'echo "Hello world"'
```

### k8s initContainer example

```yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: test
  labels:
    label: test
spec:
  replicas: 1
  selector:
    matchLabels:
      app: test
  template:
    metadata:
      labels:
        app: test
    spec:
      # Example init container downloading a file
      initContainers:
        - name: get-jts
          image: bwibo/k8s-init-container
          imagePullPolicy: Always
          args:
            - 'wget -O /mydata/test.html
              "https://my.domain.de/test.html"
               && chown -v 0:0 /mydata/test.html'

          volumeMounts:
            - name: share
              mountPath: /mydata

          securityContext:
            runAsUser: 0
            runAsGroup: 0

      containers:
        - name: nginx
          image: nginx
          ports:
            - containerPort: 80

          # Mount the file downloaded with init container to /var/www/html
          volumeMounts:
            - name: share
              mountPath: /var/www/html/test.html
              subPath: test.html

```

## :hammer_and_wrench: Contributing

Bug fixes, issue reports and contributions are greatly appreciated.

### Contributors

<a href="https://github.com/bwibo">
  <img src="https://contrib.rocks/image?repo=bwibo/k8s-init-container" />
</a>

## :memo: License

This Helm chart is distributed under the Apache License 2.0. See [LICENSE](LICENSE) for more information.
