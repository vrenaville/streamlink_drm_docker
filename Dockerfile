FROM python:3.12-alpine

RUN apk add git
RUN apk add ffmpeg
RUN apk add curl
RUN apk add jq 
RUN adduser --disabled-password --gecos '' streamlink
USER streamlink
RUN pip install --user -U git+https://github.com/vrenaville/streamlink_DRM 
EXPOSE 4444 
CMD export HLS=`curl -s https://www.rtp.pt/play/livechannelonair.php?channel=$CHANNEL_ID | jq '.raw.result[0].hls_url' | xargs -n1 echo` && ./home/streamlink/.local/bin/streamlink --ffmpeg-dkey $STREAM_KEY --player-external-http --player-external-http-interface 0.0.0.0 --player-external-http-port 4444 $HLS best && spleep 1880
