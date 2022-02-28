#!/bin/bash
sudo apt-get update && sudo apt -y install apache2
echo '<html><h1>Welcome</h1></html>' > /var/www/html/index.html
