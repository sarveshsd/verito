kubectl apply -f pv.yml
kubectl apply -f pvc.yml
kubectl apply -f k8s/postgres-deployment.yml
kubectl apply -f k8s/backend-deployment.yml
kubectl apply -f k8s/frontend-deployment.yml
