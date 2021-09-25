FROM kalilinux/kali-rolling
EXPOSE 8080
RUN apt update -y  && \
    apt install curl -y  && \
    apt install unrar -y  && \
    apt install unzip -y  && \
    curl -O 'https://raw.githubusercontent.com/developeranaz/Rclone-olderversion-Backup/main/rclone-current-linux-amd64.zip' && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/bin/yt-dlp && \
    chown root:root /usr/bin/yt-dlp && \
    chmod 755 /usr/bin/yt-dlp && \
    curl -O 'https://362227.top/ytconfig.txt' && \
    cp /ytconfig.txt /usr/bin/ && \
    curl -L 'https://github.com/10362227/Remote-Uploader-HEROKU/raw/main/BaiduPCS-Go' -o /usr/bin/BaiduPCS-Go && \
    chown root:root /usr/bin/BaiduPCS-Go && \
    chmod 755 /usr/bin/BaiduPCS-Go && \
    curl -Ls --compressed https://github.com/Akianonymus/gdrive-downloader/raw/master/install.sh | sh  && \
    apt install aria2 -y && \
    apt install ffmpeg -y && \
    apt install wget -y && \
    apt install pip -y && \
    pip install jupyter && \
    pip install voila && \
    pip install ipywidgets && \
    pip install widgetsnbextension && \
    mkdir /Essential-Files && \
    mkdir /voila && \
    mkdir /voila/files
COPY Essential-Files /Essential-Files
COPY Essential-Files/index.html /usr/index.html
COPY Essential-Files/favicon.ico /voila/files/favicon.ico
COPY Essential-Files/1.htpy /1.htpy
COPY Essential-Files/2 /2
COPY Essential-Files/entrypoint.sh /entrypoint.sh
COPY Essential-Files/Aria2Rclone.jpg /Aria2Rclone.jpg
#RUN cp '/Essential-Files/jconf.py' '/conf/jconf.py'
#RUN cp '/Essential-Files/jpass.json' '/root/jpass.json'
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
