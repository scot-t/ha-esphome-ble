#!/bin/bash
# entrypoint.sh - custom entrypoint for homeassistant container

# task: reset modified files in /config volume to source
# description:
#	this enables docker build to install custom components
#	while container has volume mount overriding /config.
#	dockerfile has custom step to cp base /config to /var/homeassistant
cp -rf /var/homeassistant/config /

# task: load original container entrypoint
# description:
#	homeassistant base image sets entrypoint to /init, which
#	is a shell script wrapper that launches s6. s6-overlay-suexec
#   must be run as pid 1
exec /init

