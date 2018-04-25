FROM alpine:edge
MAINTAINER smounives <smounives@outlook.com>

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --update --no-cache add alpine-desktop xfce4 chromium chromium-chromedriver wqy-zenhei@testing faenza-icon-theme bash openssh net-tools mtr iperf3 wireshark && rm -rf /tmp/* /var/cache/apk/*
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
RUN echo "CHROMIUM_FLAGS="\""--no-sandbox"\""" >> /etc/chromium/chromium.conf

CMD startxfce4
