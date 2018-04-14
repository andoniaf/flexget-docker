#!/bin/bash

sed "s@\$RSS_URL@$RSS_URL@" </root/flexget/config_base.yml >/root/.flexget/config.yml
sed -i "s@\$SUBTITLES_LANGUAGE@$SUBTITLES_LANGUAGE@" /root/.flexget/config.yml

/usr/local/bin/flexget "$@"
