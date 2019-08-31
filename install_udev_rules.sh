cd ~/dots/udev_rules
for f in ./*.rules
do
    sudo cp $f /etc/udev/rules.d/
done

