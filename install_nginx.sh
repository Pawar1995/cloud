#!/bin/bash
#
#
#
   #!/bin/bash

# Script to install NGINX on a Debian/Ubuntu system

echo "🔍 Updating package list..."
sudo apt update

echo "⬇️ Installing NGINX..."
sudo apt install -y nginx

echo "✅ NGINX installed successfully."

echo "🚀 Starting NGINX service..."
sudo systemctl start nginx

echo "🔄 Enabling NGINX to start on boot..."
sudo systemctl enable nginx

echo "📡 Checking NGINX status..."
sudo systemctl status nginx

echo "🌐 You can now access NGINX at http://localhost or your server's IP."

