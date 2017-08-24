sudo docker images | grep '<none>' | awk '{ print $3 }' | sudo xargs -r docker rmi
