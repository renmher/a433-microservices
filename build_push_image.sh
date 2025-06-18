#!/bin/sh

# variable yg dibutuhkan serta value nya
image_name="item-app"
image_version="v1"
github_account="renmher"

# buat image di Docker menggunakan docker build
echo -e "Building a new Docker image:"
docker build . -t $image_name:$image_version

# Liat daftar images
echo -e "\nViewing the list of Docker images:"
docker images

# mengubah nama image agar sesuai dengan format GitHub Packages
echo -e "\nGiving a new tag name to the Docker image to match the format of GitHub Container Registry:"
docker tag $image_name:$image_version ghcr.io/$github_account/$image_name:$image_version
docker images

# login ke GitHub Container Registry/Github Pacakges
echo -e "\nLogin into GitHub Container Registry:"
docker login ghcr.io -u $github_account

# push image
echo -e "\nPublishing image to GitHub Container Registry:"
docker push ghcr.io/$github_account/$image_name:$image_version

# cetak selesai
echo -e "\nDone."
