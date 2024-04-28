#!/bin/sh
TAILSCALE_HOSTNAME=otngn
./tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 &
until ./tailscale up --hostname=${TAILSCALE_HOSTNAME} --advertise-exit-node ${TAILSCALE_ADDITIONAL_ARGS}
do
    sleep 0.1
done
sleep infinity
