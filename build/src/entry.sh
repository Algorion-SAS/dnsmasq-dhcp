if [ -z "$UUID" ]; then
  UUID=1000
fi
if [ -z "$GUID" ]; then
  GUID=1000
fi

adduser -D -g $GUID -u $UUID dhcp

mkdir -p /data/conf

if ! [ -f "/data/conf/dnsmasq.conf" ]; then
    cp /data/dnsmasq.conf /data/conf/dnsmasq.conf
fi

ln -s /dev/stdout /data/supervisord.log
chmod 777 /data/supervisord.log
chown -R $UUID:$GUID /data

/usr/bin/supervisord -c /data/supervisord.conf
