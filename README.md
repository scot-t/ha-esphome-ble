# homeassistant esphome ble demo


## docker

incantations - something like:
`docker compose -f <> -f <> build`
`docker compose -f <> -f <> up`
`docker ps`

if using environment overrides, list base files before overrides

store this example in a repo, and compose will prefix all project resources with the repo name

repo is using renovate, can just delete sha tags to unpin and get latest versions within tag.

## homeassistant

initial setup - launch container, configure through UI.

example configuration .yaml included, but commented out for simplicity.

influxdb instance set up for data persistence, write-only target, HA doesn't read from this.

Should be accessible on localhost:8123 for this demo; I have caddy as a reverse proxy for external access, but that uses a coreDNS container and split DNS on the router, bit much to fit into an example. included caddy example if you want to play with it.

## esphome

setup wifi connectivitity
- open esphome in browser, plug into pc with usb (uses browser serial to access locally)
- flash config with wifi details (new -> edit -> paste -> install)
- builds will take a few minutes, watch docker cpu for status
- if you get compile errors on subsequent installs, do "clean build files" first

set static IP on esp32 using router static leases
- get wifi mac for esp32
    - watch wifi dhcp leases 
    - unplug while pinging device to confirm
- set static IP for device using router / mac address
- set `use_address` and re-flash
- may need to unplug esp32 & restart router to flush dns leases

setup android ble device
- use nRF Connect to advertise device with custom service uuid
    - good for debugging, can run persistently but not intended
- use Homeassistant app to broadcast iBeacon
    - works great with 3hz frequency
    - runs as background service
    - can configure to only broadcast on home wifi for battery



