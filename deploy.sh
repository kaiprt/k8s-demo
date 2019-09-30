echo "Building and Tagging Images"
docker build -t moonrake/multi-client:latest -t moonrake/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t moonrake/multi-server:latest -t moonrake/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t moonrake/multi-worker:latest -t moonrake/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
echo "Pushing Latest Tag"
docker push moonrake/multi-client:latest
docker push moonrake/multi-server:latest
docker push moonrake/multi-worker:latest
echo "Pushing Commit Tag: $GIT_SHA"
docker push moonrake/multi-client:$GIT_SHA
docker push moonrake/multi-server:$GIT_SHA
docker push moonrake/multi-worker:$GIT_SHA
echo "Updating Production"
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=moonrake/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=moonrake/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=moonrake/multi-worker:$GIT_SHA
