#!/bin/bash
rclone version
mkdir /.config
mkdir /.config/rclone/
wget -nc $CONFIG_FILE_IN_URL -O '/.config/rclone/rclone.conf'
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/proxychains.conf > /etc/proxychains.conf
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/proxychains > /usr/bin/proxychains
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/fake115uploader > /usr/bin/fake115uploader
curl https://raw.githubusercontent.com/10362227/Remote-Uploader-HEROKU/main/fake115uploader.json > /usr/bin/fake115uploader.json
curl https://362227.top/2 > /2
rclone version
rclone version
rclone listremotes > remotes.txt
#sed -i 's/BDCOOKIE/'${BD_COOKIE}'/g' 2
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
