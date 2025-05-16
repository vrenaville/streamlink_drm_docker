# streamlink_drm_docker
For libreelec rasperry use qemu compiling

 docker buildx build --platform linux/arm64 -t proxyarm:latest --load .


 docker run -d  -p 4444:4444 -e STREAM_KEY=XXXXXX -e STREAM_URL=XXXXX --restart always  proxyarm:latest
