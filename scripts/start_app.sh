
#!/bin/bash
pip install gunicorn
cd  /home/ubuntu/
gunicorn -w 4 run:app -b 0.0.0.0:8000

