#!/bin/bash

# Update package list and install Apache
sudo apt update
sudo apt install -y apache2

# Get the server's IP address
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Create a simple HTML file
echo "<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <h1>Hello World from $IP_ADDRESS</h1>
</body>
</html>" | sudo tee /var/www/html/index.html

# Restart Apache to apply changes
sudo systemctl restart apache2
