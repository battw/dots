#!/bin/bash
cd services
for f in *
do
    echo $f
    sudo cp -i $f /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable $f
    sudo systemctl start $f
done
cd ..
