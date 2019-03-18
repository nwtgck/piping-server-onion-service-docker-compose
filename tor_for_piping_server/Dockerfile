FROM alpine:3.9

LABEL maintainer="Ryo Ota <nwtgck@gmail.com>"

# Install Tor
RUN apk --no-cache add tor

# Hidden Server setting
# ([info] torrc.sample: https://tor.stackexchange.com/a/14667)
RUN cp /etc/tor/torrc.sample /etc/tor/torrc && \
    sed -i '/^#HiddenServiceDir/s//HiddenServiceDir/' /etc/tor/torrc && \
    sed -i '/^#HiddenServicePort 80 127.0.0.1:80/s//HiddenServicePort 80 piping:80\nHiddenServicePort 443 piping:443/' /etc/tor/torrc

ENTRYPOINT [ "sh" ]
# NOTE: The order of chown and su is important
CMD [ "-c", "chown -R tor /var/lib/tor/ && su -s /bin/sh tor -c tor" ]
