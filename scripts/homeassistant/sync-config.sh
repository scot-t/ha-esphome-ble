#!/bin/bash
# sync-config.sh - pull or push config from deployed homeassistant container

main() {
    
    
    # input
    local verb="${1:-}"
    local pattern='pull|push|reset'

    [[ ! $verb =~ $pattern ]] && {
        echo "error: expected command. usage: sync-config.sh {$pattern}"
        return 1
    }

    # consts
    local repo_location='/home/scott/git/homeops'
    local repo_config_path='/docker-images/homeassistant/config'
    local container_name='homeassistant'
    local container_config_path='/config'
    local volume_name='homeops_homeassistant-config'

    # logic
    local src dst
    case "$verb" in
        pull)
            # docker handles directory copy differently to file copy
            src="$container_name:$container_config_path" # directory
            dst="${repo_location}${repo_config_path}/.." # parent-directory
            docker cp "$src" "$dst" # copy /config directory to docker-images/homeassistant
            ;;
        push)
            src="${repo_location}${repo_config_path}" # directory
            dst="$container_name:$container_config_path/.." # directory
            docker cp "$src" "$dst" # copy docker-images/homeassistant/config to /config
            ;;
        reset)
            docker container stop $container_name
            docker container rm $container_name
            docker volume rm $volume_name
    esac

}

main "$@"
exit $?