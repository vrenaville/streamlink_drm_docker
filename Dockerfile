FROM python:3.12-alpine

RUN apk add git
RUN apk add ffmpeg
RUN apk add curl
RUN apk add jq 
RUN adduser --disabled-password --gecos '' streamlink
COPY scripts/start.sh /home/streamlink/start.sh
USER streamlink
RUN pip install --user -U git+https://github.com/vrenaville/streamlink_DRM 
EXPOSE 4444 
CMD /home/streamlink/start.sh 
