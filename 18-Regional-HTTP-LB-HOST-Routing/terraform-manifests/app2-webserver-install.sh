#!/bin/bash
sudo apt-get update # <-- add this
sudo apt-get install -y telnet
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx # <-- also add this (course probably has it elsewhere?)
sudo chmod -R 755 /var/www/html
sudo mkdir -p /var/www/html/app2
HOSTNAME=$(hostname)
sudo echo "<!DOCTYPE html> <html> <body style='background-color:rgb(110, 190, 210);'> <h1>Welcome to StackSimplify - WebVM App2 </h1> <p><strong>VM Hostname:</strong> $HOSTNAME</p> <p><strong>VM IP Address:</strong> $(hostname -I)</p> <p><strong>Application Version:</strong> V1</p> <p>Google Cloud Platform - Demos</p> </body></html>" | sudo tee /var/www/html/app2/index.html
sudo echo "<!DOCTYPE html> <html> <body style='background-color:rgb(110, 190, 210);'> <h1>Welcome to StackSimplify - WebVM App2 </h1> <p><strong>VM Hostname:</strong> $HOSTNAME</p> <p><strong>VM IP Address:</strong> $(hostname -I)</p> <p><strong>Application Version:</strong> V1</p> <p>Google Cloud Platform - Demos</p> </body></html>" | sudo tee /var/www/html/index.html
