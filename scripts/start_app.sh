
#!/bin/bash
set -e
cd install -r /home/ec2-user/
gunicorn -w 4 run:app -b 0.0.0.0:8000
