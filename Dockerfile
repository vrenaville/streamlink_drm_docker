FROM python:3.12-alpine

RUN apk add git
RUN apk add ffmpeg 
RUN adduser --disabled-password --gecos '' streamlink
USER streamlink
RUN pip install --user -U git+https://github.com/vrenaville/streamlink_DRM 
EXPOSE 4444 
CMD ./home/streamlink/.local/bin/streamlink --ffmpeg-dkey $STREAM_KEY --player-external-http --player-external-http-interface 0.0.0.0 --player-external-http-port 4444 $STREAM_URL best
