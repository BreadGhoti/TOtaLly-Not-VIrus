git clone https://github.com/BreadGhoti/TOtaLly-Not-VIrus
cd TOtaLly-Not-VIrus
pip install textual
sleep 2
python3 installer.py
docker build -t totally-not-virus . --no-cache
cd ..

sudo apt update
sudo apt install -y jq

mkdir Save
cp -r TOtaLly-Not-VIrus/root/config/* Save

json_file="TOtaLly-Not-VIrus/options.json"
if jq ".enablekvm" "$json_file" | grep -q true; then
    docker run -d --name=totally-not-virus -e PUID=1000 -e PGID=1000 --device=/dev/kvm --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=GamingOnCodespaces -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config --restart unless-stopped totally-not-virus
else
    docker run -d --name=totally-not-virus -e PUID=1000 -e PGID=1000 --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=GamingOnCodespaces -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config --restart unless-stopped totally-not-virus
then
    docker run --rm -d -p 3000:3000/tcp -p 3001:3001/tcp totally-not-virus:latest
fi
echo "INSTALL FINISHED! Check Port Tab"
