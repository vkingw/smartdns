
FROM arm64v8/debian 

LABEL maintainer="Vincent <alfa.king@gmail.com>"

RUN export URL=https://api.github.com/repos/pymumu/smartdns/releases/latest \
  && export OS="debian" \
  && apt update \
  && apt install wget \
  && apt install curl \
  && cd / \
  && wget --tries=3 $(curl -s $URL | grep browser_download_url | egrep -o 'http.+\.\w+' | grep -i "$(uname -m)" | grep -m 1 -i "$(echo $OS)") \
  && dpkg -i smartdns.*.debian.all.deb \
  && apt clean \
  && apt autoclean 

ADD start.sh /start.sh
ADD config.conf /config.conf

WORKDIR /

VOLUME ["/smartdns"]

EXPOSE 53

CMD ["/start.sh"]
