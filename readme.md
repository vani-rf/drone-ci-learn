### Generate Client ID
```
openssl rand -hex 16
```

> 0d263f227f9d98b06bc2713fedbccae3

### Setup Drone Server
```
docker run \
  --volume=/var/lib/drone:/data \
  --env=DRONE_GITHUB_CLIENT_ID=ea45186bae3501e2099f \
  --env=DRONE_GITHUB_CLIENT_SECRET=6123b738f62d9c552427ea0891c34c3f460d950e \
  --env=DRONE_RPC_SECRET=0d263f227f9d98b06bc2713fedbccae3 \
  --env=DRONE_SERVER_HOST=f44d-111-68-25-162.ngrok-free.app \
  --env=DRONE_SERVER_PROTO=https \
  --env=DRONE_RUNNER_PRIVILEGED_IMAGES=plugins/docker \
  --publish=9000:80 \
  --publish=9443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone:2
```

### Setup Docker Runner
```
docker pull drone/drone-runner-docker:1
```

```
docker run --detach \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --env=DRONE_RPC_PROTO=https \
  --env=DRONE_RPC_HOST=f44d-111-68-25-162.ngrok-free.app \
  --env=DRONE_RPC_SECRET=0d263f227f9d98b06bc2713fedbccae3 \
  --env=DRONE_RUNNER_CAPACITY=2 \
  --env=DRONE_RUNNER_NAME=local-runner \
  --publish=3000:3000 \
  --restart=always \
  --name=runner \
  drone/drone-runner-docker:1

```

### Example Badged

[![Build Status](https://f44d-111-68-25-162.ngrok-free.app/api/badges/vani-rf/drone-ci-learn/status.svg)](https://f44d-111-68-25-162.ngrok-free.app/vani-rf/drone-ci-learn)
