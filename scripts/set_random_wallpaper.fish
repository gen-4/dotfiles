#!/usr/bin/env fish

set new_wallpaper ( random choice /home/anton/images/wallpapers/* ) 
hyprctl hyprpaper unload all
hyprctl hyprpaper preload $new_wallpaper
hyprctl hyprpaper wallpaper ",$new_wallpaper"

