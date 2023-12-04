
#!/bin/bash
pip install gunicorn
cd  /home/ubuntu/
/home/ubuntu/.local/bin/gunicorn -w 4 run:app -b 0.0.0.0:8000

