replace() {
  echo "replacing $1 by $2 in $3"
  sed -i "s/$1/$2/g" $3
}

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

replace '$UUID' "$UUID" "/data/conf/dnsmasq.conf"
replace '$GUID' "$GUID" "/data/conf/dnsmasq.conf"
replace '$DHCP_START_ADDRESS' "$DHCP_START_ADDRESS" "/data/conf/dnsmasq.conf"
replace '$DHCP_END_ADDRESS' "$DHCP_END_ADDRESS" "/data/conf/dnsmasq.conf"
replace '$DHCP_ADDRESS_MASK' "$DHCP_ADDRESS_MASK" "/data/conf/dnsmasq.conf"
replace '$DHCP_LEASE_TIME' "$DHCP_LEASE_TIME" "/data/conf/dnsmasq.conf"
replace '$DHCP_ROUTER_ADDRESS' "$DHCP_ROUTER_ADDRESS" "/data/conf/dnsmasq.conf"
replace '$DHCP_DNS' "$DHCP_DNS" "/data/conf/dnsmasq.conf"

/usr/bin/supervisord -c /data/supervisord.conf
