# netmasq-dhcp
A Docker container that provide a DHCP server using netmasq.

The goal of the container is to provide a lighweigt easily configurable and deployable server on a Raspberry Pi.

On a home network with few devices it use ~10MiB of RAM

HUB: https://hub.docker.com/r/cyrius/netmasq-dhcp

## Configuration

A `docker-compose.yml` file is available as an example.

This container require the `network_mode: host` and the `NET_ADMIN` capability to work.

The docker can be configured using the environment variables.

The following variables are available :

| Name | Default value | Description | 
| ----------- | ----------- | ----------- |
| UUID | 1000 | The user id |
| GUID | 1000 | The user group id |
| DHCP_START_ADDRESS | 192.168.0.101 | The first assignable IP |
| DHCP_END_ADDRESS | 192.168.0.200 | The last assignable IP |
| DHCP_ADDRESS_MASK | 255.255.255.0 | The network mask of the assignable IPs |
| DHCP_LEASE_TIME | 24h | The duration of the lease (ex: 60, 1m, 1h ,1d) |
| DHCP_ROUTER_ADDRESS | 192.168.0.1 | The IP of the advertised network router |
| DHCP_DNS | 1.1.1.2, 1.1.1.1 | The advertised DNS IPs separated by comma |

## Volumes

The configuration are stored in the `/data/conf/` folder.

The `dnsmasq.conf` file is the configuration of dnsmasq
The `dnsmasq.leases` file contain the current lease

## Static IP

You can assign a static IP to a MAC address in the `dnsmasq.conf` file

At the bottom of the file you can add a line with the following format
`dhcp-host=MAC,STATIC_IP`

Like this
`dhcp-host=40:b0:76:ff:ff:ff,192.168.0.2 # My super PC `

You can read the `dnsmasq.leases` file to know the mac address of devices that already got a lease.

