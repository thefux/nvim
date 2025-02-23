   # #!/bin/bash

   # CONFIG_FILE=~/.config/goose/config.yaml

   # if [ "$1" == "activate" ]; then
   #     echo "Activating developer extension..."
   #     yq -i '.extensions.developer.enabled = true' $CONFIG_FILE
   # elif [ "$1" == "deactivate" ]; then
   #     echo "Deactivating developer extension..."
   #     yq -i '.extensions.developer.enabled = false' $CONFIG_FILE
   # else
   #     echo "Usage: $0 [activate|deactivate]"
   # fi

#!/bin/bash

CONFIG_FILE=~/.config/goose/config.yaml

if [ $# -lt 2 ]; then
    echo "Usage: $0 [activate|deactivate] extension_name1 [extension_name2 ...] [activate|deactivate] extension_nameN ..."
    echo "Available extensions: computercontroller, developer, memory"
    exit 1
fi

ACTION=""

for ARG in "$@"; do
    case $ARG in
        activate|deactivate)
            ACTION=$ARG
            ;;
        computercontroller|developer|memory)
            if [ -n "$ACTION" ]; then
                if [ "$ACTION" == "activate" ]; then
                    echo "Activating $ARG extension..."
                    yq -i ".extensions.$ARG.enabled = true" $CONFIG_FILE
                elif [ "$ACTION" == "deactivate" ]; then
                    echo "Deactivating $ARG extension..."
                    yq -i ".extensions.$ARG.enabled = false" $CONFIG_FILE
                fi
            else
                echo "Action not specified before extension $ARG."
                exit 1
            fi
            ;;
        *)
            echo "Invalid argument: $ARG"
            echo "Use 'activate' or 'deactivate' followed by one or more extension names."
            exit 1
            ;;
    esac
done
