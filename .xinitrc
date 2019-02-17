xset +fp /usr/share/fonts/noto  # Add noto to font path
xsetroot -solid '#282828'       # Background color
xrdb -merge ~/.Xresources       # Load .Xresources configuration into the x resource database
exec i3
