# streamlink_drm_docker
For libreelec rasperry use qemu compiling

 docker buildx build --platform linux/arm64 -t proxyarm:latest --load .


 docker run -d  -p 4444:4444 -e STREAM_KEY=XXXXXX -e STREAM_URL=XXXXX --restart always  proxyarm:latest


For RTP1 use:
docker run -d -p 4444:4444 -e STREAM_KEY=a2226def4bc8f249de2daf36b7c12b1e -e STREAM_URL=http://streaming-live.rtp.pt/liverepeater/rtpClean1HD.smil/manifest.mpd proxy64:latest

FOR RTP2 use:
