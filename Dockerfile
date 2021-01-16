FROM ghcr.io/linuxserver/calibre

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
