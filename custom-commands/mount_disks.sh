#!/bin/bash

# Create necessary directories under /mnt
sudo mkdir -p /mnt/work /mnt/os /mnt/apps /mnt/more_apps /mnt/kubuntu

# Mount the corresponding partitions
sudo mount -o defaults,uid=1000,gid=1000,fmask=0022,dmask=0000 UUID=0274C5C474C5BB25 /mnt/work
sudo mount -o defaults,uid=1000,gid=1000,fmask=0022,dmask=0000 UUID=2C1C44D11C44982A /mnt/os
sudo mount -o defaults UUID=4dd45dda-cc50-45be-ac69-ac83de3e1cd8 /mnt/apps
sudo mount -o defaults,uid=1000,gid=1000,fmask=0022,dmask=0000 UUID=01DB0C26D3EF7DA0 /mnt/more_apps
sudo mount -o defaults UUID=b8ffbfeb-52e9-443a-8cf4-ad8dc81831a1 /mnt/kubuntu

echo "All specified partitions have been mounted successfully."
