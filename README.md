docker run -d \
	-e TZ="Asia/Shanghai" \
	--restart always \
    --name openkm \
    -v /datadisk/openkm/repository:/opt/openkm/repository \
    -p 88:8080 \
    -p 2002:2002 \
    radiantwf/openkm:latest