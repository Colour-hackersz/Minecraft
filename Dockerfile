FROM ubuntu:22.04

WORKDIR /app

COPY . .

RUN apt update && apt install -y openjdk-17-jdk curl wget unzip

CMD ["bash", "start.sh"]
