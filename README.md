# Code Climate EditorConfig [![License][license-image]][license-url] [![Build Status][travis-image]][travis-url] [![Coverage Status][codeclimate-coverage]][codeclimate-url]

> Static analysis tool that validates your project files with [EditorConfig][editorconfig]

## Usage with `codeclimate.com`

Enable the engine through the `beta` channel in your `.codeclimate.yml` file:

```yaml
plugins:
  editorconfig:
    enabled: true
    channel: beta
```

## Local Usage _(development)_

* install [Docker][docker]

* install the [Code Climate CLI][codeclimate-cli]

* clone this repo and build the docker image:

  ```bash
  curl -L https://github.com/ahmadnassri/codeclimate-editorconfig/archive/master.tar.gz | tar xvz
  cd codeclimate-editorconfig-master
  make image
  ```

* add `editorconfig` to your `.codeclimate.yml` file:

  ```yaml
  plugins:
    editorconfig:
      enabled: true
  ```

* run Code Climate CLI with the `--dev` flag

  ```bash
  $ codeclimate analyze --dev

  Starting analysis
  Running editorconfig: Done!

  == README.md (1 issue) ==
  18: Expected an indentation at 2 instead of at 1. [editorconfig]

  Analysis complete! Found 1 issue.
  ```

## ➤ Requirements

- **[Docker](https://gitlab.com/megabyte-labs/ansible-roles/docker)**
- [CodeClimate CLI](https://github.com/codeclimate/codeclimate)

### Optional Requirements

- [DockerSlim](https://gitlab.com/megabyte-labs/ansible-roles/dockerslim) - Used for generating compact, secure images
- [Google's Container structure test](https://github.com/GoogleContainerTools/container-structure-test) - For testing the Docker images


### Building the Docker Container

Run the below make command from the root of this repository to create a local fat docker image
```shell
make image
```

### Building a Slim Container

Run the below make command from the root of this repository to create a local slim docker image
```shell
make slim
```


### Test

Run the below command from the root of this repository to test the images created by this repository.
```shell
make test
```


---
> :copyright: [ahmadnassri.com](https://www.ahmadnassri.com) &bull; 
> License: [ISC][license-url] &bull; 
> Github: [@ahmadnassri](https://github.com/ahmadnassri) &bull; 
> Twitter: [@ahmadnassri](https://twitter.com/ahmadnassri)

[license-url]: http://choosealicense.com/licenses/isc/
[license-image]: https://img.shields.io/github/license/ahmadnassri/codeclimate-editorconfig.svg?style=flat-square

[travis-url]: https://travis-ci.org/ahmadnassri/codeclimate-editorconfig
[travis-image]: https://img.shields.io/travis/ahmadnassri/codeclimate-editorconfig.svg?style=flat-square

[npm-url]: https://www.npmjs.com/package/${name}
[npm-version]: https://img.shields.io/npm/v/${name}.svg?style=flat-square
[npm-downloads]: https://img.shields.io/npm/dm/${name}.svg?style=flat-square

[codeclimate-url]: https://codeclimate.com/github/ahmadnassri/codeclimate-editorconfig
[codeclimate-coverage]: https://api.codeclimate.com/v1/badges/f93b60303ce434b0b007/test_coverage

[docker]: https://www.docker.com/
[editorconfig]: http://editorconfig.org
[codeclimate-cli]: https://github.com/codeclimate/codeclimate
