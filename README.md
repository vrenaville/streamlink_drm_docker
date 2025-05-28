# streamlink_drm_docker
For libreelec rasperry use qemu compiling

 docker buildx build --platform linux/arm64 -t proxyarm:latest --load .


 docker run -d  -p 4444:4444 -e STREAM_KEY=XXXXXX -e STREAM_URL=XXXXX --restart always  proxyarm:latest


For RTP1 use:

* docker run -d -p 4444:4444 -e STREAM_KEY=a2226def4bc8f249de2daf36b7c12b1e -e CHANNEL_ID=5 --restart always proxyarm:l
atest
FOR RTP2 use:
* docker run -d -p 5555:4444 -e STREAM_KEY=xxx -e CHANNEL_ID=3 --restart always proxyarm:l
atest
FOR RTPInt use:
* docker run -d -p 6666:4444 -e STREAM_KEY=xxxx -e CHANNEL_ID=120 --restart always proxyarm:l
atest
FOR RTP3 user:
* docker run -d -p 4444:4444 -e STREAM_KEY=a2226def4bc8f249de2daf36b7c12b1e -e CHANNEL_ID=64 --restart always proxyarm:l
atest
FOR zigzag
docker run -d -p 4444:4444 -e STREAM_KEY=a2226def4bc8f249de2daf36b7c12b1e -e CHANNEL_ID=1036 --restart always proxyarm:l
atest
