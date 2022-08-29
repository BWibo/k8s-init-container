
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
docker run -i -t --rm --name init bwibo/k8s-init-container
```

### Example execute a command

```shell
docker run -i -t --rm --name init bwibo/k8s-init-container -c 'echo "Hello world"'
```

### k8s initContainer example

```yaml

To BE DONE

```

## :hammer_and_wrench: Contributing

Bug fixes, issue reports and contributions are greatly appreciated.

### Contributors

<a href="https://github.com/twpayne/chezmoi/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=bwibo/k8s-init-container" />
</a>

## :memo: License

This Helm chart is distributed under the Apache License 2.0. See [LICENSE](LICENSE) for more information.
