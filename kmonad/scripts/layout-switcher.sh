#!/bin/bash
# ~/.local/bin/kmonad-switcher.sh

# Directory where configurations are stored
CONFIG_DIR="$HOME/.config/kmonad"
# KMonad binary path
KMONAD_BIN="kmonad"

# Function to kill KMonad
kill_kmonad() {
    pkill -f "$KMONAD_BIN" 2>/dev/null || true
    sleep 0.3
}

# Function to start KMonad with specific config
start_kmonad() {
    local config_file="$1"
    
    if [[ ! -f "$config_file" ]]; then
        notify-send -u critical "KMonad Error" "File not found: $config_file"
        return 1
    fi
    
    nohup "$KMONAD_BIN" "$config_file" >/dev/null 2>&1 &
    sleep 0.5
    
    if pgrep -f "kmonad.*$(basename "$config_file")" >/dev/null; then
        notify-send -u low "KMonad" "Configuration started: $(basename "$config_file")"
    else
        notify-send -u critical "KMonad Error" "Failed to start: $(basename "$config_file")"
    fi
}

# Function to list available configurations
list_configs() {
    find "$CONFIG_DIR" -name "*.kbd" -o -name "*.kmonad" | \
    while read -r config; do
        echo "$(basename "$config")"
    done
}

# Main function with Rofi menu
main() {
    # List configurations and add control options
    configs=$(list_configs)
    
    if [[ -z "$configs" ]]; then
        notify-send -u critical "KMonad" "No configurations found in $CONFIG_DIR"
        exit 1
    fi
    
    # Rofi menu with options
    choice=$(echo -e "$configs\n🔴 Stop KMonad\n🔄 Restart last\n📁 Open directory" | \
             rofi -dmenu -p "⌨️ KMonad Config" -i)
    
    [[ -z "$choice" ]] && exit 0
    
    case "$choice" in
        "🔴 Stop KMonad")
            kill_kmonad
            notify-send -u low "KMonad" "KMonad stopped"
            ;;
            
        "🔄 Restart last")
            # Try to find the last used config
            last_config=$(ps aux | grep kmonad | grep -v grep | awk '{for(i=1;i<=NF;i++) if($i ~ /\.kbd$|\.kmonad$/) print $i}' | head -1)
            if [[ -n "$last_config" && -f "$last_config" ]]; then
                kill_kmonad
                start_kmonad "$last_config"
            else
                notify-send -u normal "KMonad" "No recent configuration found"
            fi
            ;;
            
        "📁 Open directory")
            xdg-open "$CONFIG_DIR"
            ;;
            
        *)
            # Assume it's a configuration file
            config_file="$CONFIG_DIR/$choice"
            if [[ -f "$config_file" ]]; then
                kill_kmonad
                start_kmonad "$config_file"
            else
                notify-send -u critical "KMonad Error" "Configuration not found: $choice"
            fi
            ;;
    esac
}

# Execute main function
main "$@"
