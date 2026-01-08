chosen=$(printf "󰐥 Power Off\n Restart\n Log out\n󰤄 Suspend\n Lock Screen" | rofi -dmenu -i -l 5 -theme ~/.config/rofi/config.rasi)

case "$chosen" in 
    "󰐥 Power Off")
        shutdown now
        ;;
    " Restart")
        reboot
        ;;
    "󰍃 Log out")
        i3-msg exit
        ;;
    "󰤄 Suspend")
        systemctl suspend
        ;;
    " Lock Screen")
        ~/.config/i3/lock.sh
        ;;
    *)
        exit 1
        ;;
esac
