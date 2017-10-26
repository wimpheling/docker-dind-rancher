FROM docker:dind

RUN apk update
RUN apk add ca-certificates wget openssl
RUN update-ca-certificates
RUN wget https://github.com/rancher/cli/releases/download/v0.6.4/rancher-linux-amd64-v0.6.4.tar.gz
RUN tar xzf rancher-linux-amd64-v0.6.4.tar.gz
RUN rm rancher-linux-amd64-v0.6.4.tar.gz
RUN mv rancher-v0.6.4/rancher ./bin
RUN rmdir rancher-v0.6.4

RUN wget https://github.com/rancher/rancher-compose/releases/download/v0.12.5/rancher-compose-linux-amd64-v0.12.5.tar.gz
RUN tar xzf rancher-compose-linux-amd64-v0.12.5.tar.gz
RUN rm rancher-compose-linux-amd64-v0.12.5.tar.gz
RUN ls -al rancher-compose-v0.12.5
RUN mv rancher-compose-v0.12.5/rancher-compose ./bin
RUN rmdir rancher-compose-v0.12.5

RUN nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay&
