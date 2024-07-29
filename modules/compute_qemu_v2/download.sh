#!/bin/bash

IMAGE_URL="https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
IMAGE_PATH="/root/ubuntu-24-amd64.img"

if [ -f "$IMAGE_PATH" ]; then
  echo "Image file already exists at $IMAGE_PATH, skipping download."
else
  echo "Downloading image from $IMAGE_URL to $IMAGE_PATH..."
  wget -O $IMAGE_PATH $IMAGE_URL
fi
