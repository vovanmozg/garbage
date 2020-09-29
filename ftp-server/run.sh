docker run -d \
            -p 21:21 \
            -p 21000-21010:21000-21010 \
            -e USERS="user|user" \
            delfer/alpine-ftp-server

#docker run --rm -d --name ftpd_server -p 21:21 -p 30000-30009:30000-30009 stilliard/pure-ftpd bash /run.sh -c 30 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P localhost -p 30000:30059 FTP_USER_NAME=user -e FTP_USER_PASS=user -e FTP_USER_HOME=/home/user

#docker run -p 21:21 -it --rm -e FTP_USER=user -e FTP_PASS=user  mcreations/ftp

#docker run -p 21:21 -it --rm -e FTP_USER=user -e FTP_PASS=user -e HOST=ftp.mozg mcreations/ftp


# docker run -d -v data:/home/vsftpd \
#                 -p 20:20 -p 21:21 -p 47400-47470:47400-47470 \
#                 -e FTP_USER=user \
#                 -e FTP_PASS=user \
#                 -e PASV_ADDRESS=NO \
#                 --name ftp \
#                 --restart=always bogem/ftp