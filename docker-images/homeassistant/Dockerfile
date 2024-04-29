FROM ghcr.io/home-assistant/home-assistant:2024.3.1@sha256:9dade9391001b769a791a03faf9f193a9c801e711922f0469d27a3d923b9dfe0
    # dockerfile:   https://github.com/home-assistant/docker/blob/master/Dockerfile
    # dockerfile2:  https://github.com/home-assistant/docker-base/blob/master/alpine/Dockerfile
    # repository:   https://github.com/home-assistant/core/pkgs/container/home-assistant
    # docs:         https://www.home-assistant.io/installation/linux#install-home-assistant-container


# Package

# install HACS

    # manual install, as provided install script expects to be run after homeassistant has 
    # launched. it looks for this .HA_VERSION file and compares against targetVersion from 
    # https://github.com/hacs/integration/blob/main/custom_components/hacs/const.py

    # addons installed by HACS are updated at runtime

SHELL   ["/bin/bash", "-o", "pipefail", "-c"]
RUN     wget -q "https://github.com/hacs/integration/releases/latest/download/hacs.zip"; \
        mkdir -p /config/custom_components/hacs; \
        unzip ./hacs.zip -d /config/custom_components/hacs; \
        rm -f ./hacs.zip
        

# optional two-step copy via custom entrypoint. yaml config is modified by HA at runtime, so 
# can't easily be managed from git. can obsinately use sync-config.sh for a pull/commit/build 
# workflow, but be aware config changes via UI can be lost on restart.

# RUN     mkdir -p /var/homeassistant; \
#         cp -r /config /var/homeassistant/

# COPY    ./entrypoint.sh /

# ENTRYPOINT []
# CMD ["/entrypoint.sh"]

# Release
