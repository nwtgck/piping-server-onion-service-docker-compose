FROM alpine:3.15.4

LABEL maintainer="Ryo Ota <nwtgck@nwtgck.org>"

# Install Tor
RUN apk --no-cache add tor

ENTRYPOINT [ "sh" ]
# NOTE: The order of chown and su is important
CMD [ "-c", \
      "chmod -R go-rwx /var/lib/tor/ && \
      chown -R tor /var/lib/tor/ && \
      su -s /bin/sh tor -c tor" \
    ]
