#! /bin/bash

curl -X 'POST' -i \
  'http://localhost:5000/' \
  -H 'Content-Type: application/json' \
  -d '{  
    "name": "nam 1",
    "email": "email-1@gmail.com",
    "password": "password-1"
}' 
 

echo "USERS COUNT : "
curl -X 'GET' -i 'http://localhost:5000/users/count' -H 'Content-Type: application/json'  
   
 
#
kubectl delete -f YAML-STANDAR/ingress.yaml
kubectl delete -f YAML-STANDAR/node-service.yaml
kubectl delete -f YAML-STANDAR/node-deployment.yaml

kubectl delete -f YAML-STANDAR/postgres-service.yaml 
kubectl delete -f YAML-STANDAR/postgres-statefulset.yaml 
kubectl delete -f YAML-STANDAR/secret.yaml
kubectl delete -f YAML-STANDAR/configmap.yaml
kubectl delete -f YAML-STANDAR/pvc.yaml



 
# create secret 
kubectl apply -f YAML-STANDAR/secret.yaml
kubectl apply -f YAML-STANDAR/configmap.yaml
kubectl apply -f YAML-STANDAR/pvc.yaml
kubectl apply -f YAML-STANDAR/postgres-statefulset.yaml 
kubectl apply -f YAML-STANDAR/postgres-service.yaml 

kubectl apply -f YAML-STANDAR/node-deployment.yaml
kubectl apply -f YAML-STANDAR/node-serviceaml
kubectl apply -f YAML-STANDAR/ingres.yaml

echo "# building fastapi image ..." 
docker build -t streaming_fastapi_image:latest .

#
kubectl exec -it fastapi-deployment-69b4b65499-t9vq8 -- sh
