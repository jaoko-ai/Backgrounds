#!/bin/bash

# Directory where your 8 wallpapers are stored
WALLPAPER_DIR="$HOME/Backgrounds/Catalina"

# Automatically find your XFCE monitor property path
XFCE_PROPERTY=$(xfconf-query -c xfce4-desktop -l | grep 'last-image' | head -n 1)

while true; do
    # Get the current hour in a 24-hour format (00-23)
    HOUR=$(date +%-H)

    # Divide the 24-hour day into 8 distinct 3-hour blocks
    if [ "$HOUR" -ge 5 ] && [ "$HOUR" -lt 8 ]; then
        WAL="Catalina3.jpg"  # 05:00 - 07:59 (Sunrise)
    elif [ "$HOUR" -ge 8 ] && [ "$HOUR" -lt 11 ]; then
        WAL="Catalina4.jpg"  # 08:00 - 10:59 (Morning)
    elif [ "$HOUR" -ge 11 ] && [ "$HOUR" -lt 14 ]; then
        WAL="Catalina5.jpg"  # 11:00 - 13:59 (Midday)
    elif [ "$HOUR" -ge 14 ] && [ "$HOUR" -lt 17 ]; then
        WAL="Catalina6.jpg"  # 14:00 - 16:59 (Afternoon)
    elif [ "$HOUR" -ge 17 ] && [ "$HOUR" -lt 20 ]; then
        WAL="Catalina7.jpg"  # 17:00 - 19:59 (Sunset)
    elif [ "$HOUR" -ge 20 ] && [ "$HOUR" -lt 23 ]; then
        WAL="Catalina8.jpg"  # 20:00 - 22:59 (Evening)
    elif [ "$HOUR" -ge 23 ] || [ "$HOUR" -lt 2 ]; then
        WAL="Catalina2.jpg"  # 23:00 - 01:59 (Night)
    else
        WAL="Catalina1.jpg"  # 02:00 - 04:59 (Late Night/Pre-dawn)
    fi

    # Apply the wallpaper if the desktop path exists
    if [ -n "$XFCE_PROPERTY" ]; then
        xfconf-query -c xfce4-desktop -p "$XFCE_PROPERTY" -s "$WALLPAPER_DIR/$WAL"
    fi

    # Rest for 30 minutes before checking the time again
    sleep 180
done
