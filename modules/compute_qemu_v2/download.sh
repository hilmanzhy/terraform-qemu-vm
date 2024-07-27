# #!/bin/bash

# # URL dari image yang akan diunduh
# IMAGE_URL="https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
# # Lokasi penyimpanan di server Proxmox
# IMAGE_PATH="/var/lib/vz/template/iso/ubuntu-20.04-server-cloudimg-amd64.img"

# # Unduh image
# wget -O $IMAGE_PATH $IMAGE_URL

# # Konversi image ke QCOW2
# qemu-img convert -f raw -O qcow2 $IMAGE_PATH /var/lib/vz/template/iso/ubuntu-20.04-server-cloudimg-amd64.qcow2

#!/bin/bash

# URL dari image yang akan diunduh
IMAGE_URL="https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
# Lokasi penyimpanan di server Proxmox
IMAGE_PATH="/var/lib/vz/template/iso/ubuntu-20.04-server-cloudimg-amd64.img"
QCOW2_IMAGE_PATH="/root/ubuntu-20.04-server-cloudimg-amd64.qcow2"

# Periksa apakah file sudah ada
if [ -f "$QCOW2_IMAGE_PATH" ]; then
  echo "Image file already exists at $QCOW2_IMAGE_PATH, skipping download."
else
  # Unduh image
  echo "Downloading image from $IMAGE_URL to $IMAGE_PATH..."
  wget -O $IMAGE_PATH $IMAGE_URL

  # # Konversi image ke QCOW2
  # echo "Converting image to QCOW2 format..."
  # qemu-img convert -f raw -O qcow2 $IMAGE_PATH $QCOW2_IMAGE_PATH
fi
