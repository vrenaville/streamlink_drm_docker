#!/bin/sh
if [[ -z "${STREAM_KEY}" ]]; then
  KEY_ARG=""
else
  if [[ $STREAM_KEY == "RTP1" ]]; then
    STREAM_KEY=`curl -s https://raw.githubusercontent.com/LITUATUI/M3UPT/refs/heads/main/M3U/M3UPT.m3u | grep -A 5 RTP1.pt  -m 1 | grep license_key | cut -d '=' -f 2 | cut -d ':' -f 2`
  else
    STREAM_KEY=${STREAM_KEY}
  fi
  KEY_ARG="--ffmpeg-dkey ${STREAM_KEY}"
fi
if [[ -z "${STREAM_URL}" ]]; then
  STREAM=`curl -s https://www.rtp.pt/play/livechannelonair.php?channel=$CHANNEL_ID | jq '.raw.result[0].hls_url' | xargs -n1 echo` 
else
  STREAM=${STREAM_URL}
fi
echo "Used key : ${STREAM_KEY}"
echo "Used Stream: ${STREAM_URL}"
./home/streamlink/.local/bin/streamlink  --http-header "User-Agent=Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" $KEY_ARG --player-external-http --stream-segment-threads 4 --player-external-http-interface 0.0.0.0 --player-external-http-port 4444 $STREAM best 
