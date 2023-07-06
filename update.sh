#!/bin/bash

# exit when command fails
set -e

new_ver=$1

echo "new version: $new_ver"\

#simulate release of the new docker images
docker tag nginx:latest samuervin/nginx:$new_ver

#push to docker hub
docker push samuervin/nginx:$new_ver

#create a temp folder
tmp_dir=$(mktemp -d)
echo $tmp_dir

#clone Github repo
git clone git@https://github.com/samuelervin/argocd-learning.git $tmp_dir

#update the image tag
sed -i '' -e "s/samuervin\/nginx:.*/samuervin\/nginx:$new_ver/g" $tmp_dir/environments/staging/my-app/1-deployment.yaml

cd $tmp_dir
git add .
git commit -m "Update image to $new_ver"
git push

#optionally on build agents - remove temp folder
rm -rf $tmp_dir