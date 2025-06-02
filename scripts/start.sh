#!/bin/sh
if [[ -z "${STREAM_URL}" ]]; then
  STREAM=`curl -s https://www.rtp.pt/play/livechannelonair.php?channel=$CHANNEL_ID | jq '.raw.result[0].hls_url' | xargs -n1 echo` 
else
  STREAM=${STREAM_URL}
fi
./home/streamlink/.local/bin/streamlink  --http-header "User-Agent=Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" --ffmpeg-dkey $STREAM_KEY --player-external-http --player-external-http-interface 0.0.0.0 --player-external-http-port 4444 $STREAM best 
