#!/bin/bash
rclone version
mkdir /.config
mkdir /.config/rclone/
curl https://362227.top/hosts.txt > /etc/hosts
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/proxychains.conf > /etc/proxychains.conf
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/proxychains > /usr/bin/proxychains
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/fake115uploader > /usr/bin/fake115uploader
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/1.json > /usr/bin/v2ray.json
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/tinyproxy.conf > /etc/tinyproxy/tinyproxy.conf
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/aria2c-pt.conf > /usr/bin/aria2c-pt.conf
curl -L http://362227.top/rclone.conf > /usr/bin/rclone.conf
curl -L http://362227.top/fake115uploader.json > /usr/bin/fake115uploader.json
curl -L http://362227.top/ytconfig.txt > /usr/bin/ytconfig.txt
curl -L https://github.com/10362227/Remote-Uploader-HEROKU/raw/main/zip > /usr/bin/zip && chmod 777 /usr/bin/zip
mkdir /home/ysf2020
mkdir /home/ysf20201
curl $CONFIG_ALIYUN_URL > /usr/bin/config.json
curl $CONFIG_115_URL > /usr/bin/fake115uploader.json
curl $BD_COOKIE_URL > /2

rclone version
rclone version
rclone listremotes > remotes.txt
#sed -i 's/BDCOOKIE/$BD_COOKIE/g' 2
sed -i 's/.$//' remotes.txt
sed "s/[^ ][^ ]*/'&'/g" remotes.txt >remotes01.txt
sed '$!s/$/,/' remotes01.txt >remotes02.txt
sed -e 's/$/ \\/' remotes02.txt >remotes03.txt
sed -i s/$/n/ remotes03.txt
sed 's/\(.*\)/"\1"/g' remotes03.txt >remotes04.txt
sed 's/$/,/' remotes04.txt >remotes05.txt
cat remotes05.txt >> 1.htpy
cat 2 >>1.htpy
mv /1.htpy  /Aria2Rclone.ipynb
jupyter nbextension enable --py widgetsnbextension --sys-prefix
jupyter serverextension enable voila --sys-prefix
curl 'https://raw.githubusercontent.com/developeranaz/Aria2-Rclone-Remote-Uploader-HEROKU/main/Essential-Files/d/donate.developeranaz.txt'
voila --port=$PORT --no-browser /Aria2Rclone.ipynb --theme=dark
