
#!/bin/bash

cd  /home/ubuntu/
docker build -t docker-image ./dockerfiles
docker run -d -p 80:8000 docker-image

