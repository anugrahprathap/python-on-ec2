
#!/bin/bash

gunicorn -w 4 run:app -b 0.0.0.0:8000
