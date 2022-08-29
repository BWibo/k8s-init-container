
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

### Interactive usage

The image is available from [dockerhub/bwibo](https://hub.docker.com/repository/docker/bwibo):

```shell
docker pull bwibo/k8s-init-container

docker run -i -t --rm --name init bwibo/k8s-init-container
```

### k8s initContainer example

```yaml

To BE DONE

```
