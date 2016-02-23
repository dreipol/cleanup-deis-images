## Delete old Releases of Docker Images [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/dreipol/cleanup-deis-images/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/dreipol/cleanup-deis-images/?branch=master) ![License](https://img.shields.io/badge/license-MIT%20License-blue.svg)

If you release often your build server will collect a large amount of images that are no longer used.
This script keeps your Deis cluster slick by removing app versions that are older than *n* releases.

## Usage

You need to mount the docker socket into the container in order for the script
to access and cleanup the images.

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock quipper/cleanup-deis-images
```

## Configure

You can specify how many versions should be kept (`4` per default) by setting
the `KEEP_LAST_VERSIONS` env var.

```bash
docker run --rm \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -e KEEP_LAST_VERSIONS=3 quipper/cleanup-deis-images
```

If you have images from `v2` up to `v6` the script will remove all images
older than `v6 - n`. With the default of `4` this will
only remove the image `10.21.2.170:5000/zermatt-microsite:v2`

```bash
10.21.2.170:5000/zermatt-microsite:v6
10.21.2.170:5000/zermatt-microsite:v5
10.21.2.170:5000/zermatt-microsite:v4
10.21.2.170:5000/zermatt-microsite:v3
10.21.2.170:5000/zermatt-microsite:v2
```

## Daily Fleet Schedule

You can use the `cleanup-images.service` file together with the `cleanup-iamges.timer` unit
to regularly schedule a cleanup of your machines via `fleet`.

```bash
fleetctl start cleanup-images
fleetctl start cleanup-images.timer
```
