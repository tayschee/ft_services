minikube start --extra-config=apiserver.service-node-port-range=1-35000 --apiserver-port=12345 --apiserver-ips=192.168.64.7
eval $(minikube docker-env)
MINIKUBE_IP=$(minikube ip)
#sed 's/MINIKUBE_IP/'$MINIKUBE_IP'/g' srcs/wordpress/docker/wp-config-sample.php > srcs/wordpress/docker/wp-config.php
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f srcs/config-metallb.yml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" >> /dev/null
docker build -t nginx:local srcs/nginx/.
docker build -t ftps:local srcs/ftps/.
docker build -t wordpress:local srcs/wordpress
docker build -t mysql:local srcs/mysql
docker build -t grafana:local srcs/grafana
docker build -t phpmyadmin:local srcs/phpmyadmin
docker build -t influxdb:local srcs/influxdb
kubectl create -f srcs/wordpress/kubernetes/wordpress.yml
kubectl create -f srcs/mysql/kubernetes/mysql.yml
kubectl create -f srcs/nginx/kubernetes/deploy_nginx.yml
kubectl create -f srcs/nginx/kubernetes/expose_nginx.yml
kubectl create -f srcs/ftps/kubernetes/deploy_ftps.yml
kubectl create -f srcs/ftps/kubernetes/expose_ftps.yml
kubectl create -f srcs/grafana/kubernetes/deploy_grafana.yml
kubectl create -f srcs/phpmyadmin/kubernetes/deploy_phpmyadmin.yml
kubectl create -f srcs/phpmyadmin/kubernetes/expose_phpmyadmin.yml
kubectl create -f srcs/grafana/kubernetes/expose_grafana.yml
kubectl create -f srcs/influxdb/kubernetes/deploy_influxdb.yml
kubectl create -f srcs/influxdb/kubernetes/expose_influxdb.yml
kubectl create -f srcs/influxdb/kubernetes/pvc.yaml
minikube dashboard
