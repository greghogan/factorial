<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->

## Building the development container

A reproducible [GNU Guix](https://guix.gnu.org) Linux container can be created
with a channels file listing the source repository and commit ID as well as a
manifest file listing the set of packages to be installed.

```console
guix time-machine \
  --channels=channels.scm \
  -- pack \
    --format=docker \
    --compression=xz \
    --save-provenance \
    --symlink=/bin=bin \
    --symlink=/sbin=sbin \
    --system=x86_64-linux \
    --manifest=develop-manifest.scm
```

The provided channels and manifest file were originally exported from a profile
on a running GNU Guix system but can be updated in place.

```console
guix package \
  --export-channels
```

```console
guix package \
  --export-manifest
```

The last output lines from the pack command list the derivation and output
files. The derivation file (with a '.drv' suffix) is a text file describing the
build configuration.

```console
building /gnu/store/...-custom-utf8-locales-clang-toolchain-docker-pack.tar.xz.drv...
/gnu/store/...-custom-utf8-locales-clang-toolchain-docker-pack.tar.xz
```

The container file can be loaded as a [Docker](https://www.docker.com) image.

```console
docker load < /gnu/store/...-custom-utf8-locales-clang-toolchain-docker-pack.tar.xz
```

The docker image must be tagged before uploading to the [GitHub Container
Repository](https://ghcr.io). A GitHub
[personal access token](https://github.com/settings/tokens) with
"write:packages" scope is necessary for authorization.

```console
GROUP="greghogan"
TOKEN=<token>

echo "${TOKEN}" | docker login ghcr.io -u "${GROUP}" --password-stdin
```

The image ID of the loaded GUIX image can be viewed in the output of `docker
images` and tagged for upload to the container repository.

```console
PROJECT="factorial"
VERSION=`date +%Y%m%d`

IMAGE_ID=<image id>

TAG="ghcr.io/${GROUP}/${PROJECT}:${VERSION}"
docker tag "${IMAGE_ID}" "${TAG}"
docker push $TAG
```

The project can be loaded in an IDE supporting container-based development such
as [JetBrains CLion](https://www.jetbrains.com/clion), or on the command-line
using the container with a
[bind mount](https://docs.docker.com/storage/bind-mounts).

```console
docker run -it \
  --mount "type=bind,source=${PROJECT},target=/tmp/${PROJECT}" \
  "ghcr.io/${GROUP}/${PROJECT}:${VERSION}" \
  bash
```

## Building the release package

This project can be built as a [GNU Guix](https://guix.gnu.org) package.

```console
guix build --manifest=release-manifest.scm
```

The Guix package definition contains the hash of the project source, so must be
updated in a subsequent commit to the tagged release.

During development the package can be built using the local source directory.

```console
guix build --manifest=release-manifest.scm --with-source=../../../factorial
```

## Building the release container

The package manifest can also be built as a deployment container.

```console
guix time-machine \
  --channels=channels.scm \
  -- pack \
    --format=docker \
    --compression=xz \
    --save-provenance \
    --symlink=/bin=bin \
    --symlink=/sbin=sbin \
    --system=x86_64-linux \
    --manifest=release-manifest.scm
```

The container can then be loaded and the program executed.

```console
docker load < /gnu/store/...-factorial-docker-pack.tar.xz
docker run -it factorial hello
> Hello, World!
```
