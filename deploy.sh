docker build -t moonrake/multi-client:latest -t moonrake/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t moonrake/multi-server:latest -t moonrake/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t moonrake/multi-worker:latest -t moonrake/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
# docker push moonrake/multi-client:latest
# docker push moonrake/multi-server:latest
# docker push moonrake/multi-worker:latest

docker push moonrake/multi-client:latest$GIT_SHA
docker push moonrake/multi-server:latest$GIT_SHA
docker push moonrake/multi-worker:latest$GIT_SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=moonrake/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment server=moonrake/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment server=moonrake/multi-server:$GIT_SHA
