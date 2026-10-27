#!/bin/bash

# Pega o nome do teclado principal
KEYBOARD=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .name')

# Alterna para o próximo layout
hyprctl switchxkblayout "$KEYBOARD" next

# Pega o layout atual (mostra se é altgr-intl ou não)
CURRENT_LAYOUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

# Define ícone e mensagem baseado no layout
if [[ "$CURRENT_LAYOUT" == "English (intl., with AltGr dead keys)" ]]; then
    hyprctl keyword input:kb_options "lv3:alt_switch"
    ICON="🌐"
    MESSAGE="US International (altgr-intl)\nAcentos: Alt + a = á"
else
    hyprctl keyword input:kb_options ""
    ICON="🇺🇸"
    MESSAGE="US Standard\nAlt normal para atalhos"
fi

# Envia notificação
notify-send -t 1500 -u normal "$ICON Layout do Teclado" "$MESSAGE" -a "Keyboard"
