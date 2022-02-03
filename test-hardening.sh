
export image=citypay/api:6.0.0-BETA

docker history $image

docker run -it --net host --disable-content-trust --pid host --userns host --cap-add audit_control \
    -e DOCKER_CONTENT_TRUST=1 \
    -v /etc:/etc \
    -v /var/lib:/var/lib:ro \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --label docker_bench_security \
    docker/docker-bench-security -t $image -c container_images


