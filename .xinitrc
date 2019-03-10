xset +fp /usr/share/fonts/noto  # Add noto to font path
xsetroot -solid '#282828'       # Background color
xrdb -merge ~/.Xresources       # Load .Xresources configuration into the x resource database

compton -b
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"

exec i3
