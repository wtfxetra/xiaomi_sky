#!/bin/bash

rm -rf .repo/local_manifests


export TZ=Asia/Kolkata
export BUILD_USERNAME==wtfxetra
export BUILD_HOSTNAME=crave

repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs

repo sync -c -j"$(nproc --all)" --force-sync --no-clone-bundle --no-tags || /opt/crave/resync.sh
# for safe sync
repo sync -c -j"$(nproc --all)" --force-sync --no-clone-bundle --no-tags || /opt/crave/resync.sh

rm -rf device/xiaomi/sky
rm -rf device/xiaomi/sky-kernel
rm -rf vendor/xiaomi/fog


git clone https://github.com/sm4450-development/device_xiaomi_sky device/xiaomi/sky -b 16 --depth 1
git clone https://github.com/sm4450-development/vendor_xiaomi_sky vendor/xiaomi/sky -b 16 --depth 1
git clone https://github.com/sm4450-development/device_xiaomi_sky-kernel device/xiaomi/sky-kernel -b 16 --depth 1

. build/envsetup.sh

lunch lineage_sky-bp2a-user

m lunaris
