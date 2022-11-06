
FROM arm64v8/debian 

LABEL maintainer="Vincent <alfa.king@gmail.com>"

RUN apt update

RUN apt install -y wget
  
RUN apt install -y curl \
  && cd / 

RUN wget --tries=3 $(curl -s https://api.github.com/repos/pymumu/smartdns/releases/latest | grep browser_download_url | egrep -o 'http.+\.\w+' | grep -i "$(uname -m)" | grep -m 1 -i "$(echo debian)")
  
RUN dpkg -i smartdns.*.aarch64-debian-all.deb

RUN apt clean
RUN apt autoclean 

ADD start.sh /start.sh
ADD config.conf /config.conf

WORKDIR /

VOLUME ["/smartdns"]

EXPOSE 53

CMD ["/start.sh"]
