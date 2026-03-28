#!/bin/bash

echo "Starting Minecraft server..."

apt update
apt install -y openjdk-17-jdk curl wget unzip

accept eula

echo "eula=true" > eula.txt

download server jar

if [ ! -f server.jar ]; then
wget https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/127/downloads/paper-1.21.11-127.jar -O server.jar
fi

download world (REPLACE WORLD_FILE_ID)

if [ ! -d world ]; then
echo "Downloading world..."
wget "https://drive.google.com/uc?export=download&id=WORLD_FILE_ID" -O world.zip
unzip -o world.zip
fi

install playit tunnel

curl -SsL https://playit.cloud/setup.sh | bash
./playit &

run server (auto restart)

while true
do
java -Xms1G -Xmx2G -jar server.jar nogui
echo "Restarting in 5 seconds..."
sleep 5
done
