## Delete old Releases of Docker Images

If you release often your build server will collect a large amount of images that are no longer used.
This script keeps your Deis cluster slick by removing app versions that are older than *n* releases.

## Usage

You need to mount the docker socket into the container in order for the script
to access and cleanup the images.

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock dreipol/cleanup-versions
```
