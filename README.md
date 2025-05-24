# KD Phishing

KD Phishing is a red-team focused phishing simulation tool for Facebook, Instagram, and more. Perfect for ethical hacking, awareness training, and bug bounty testing.

## Features
- Facebook & Instagram phishing templates
- IP & User-Agent logging
- Tunnel via localhost.run
- Clean CLI UI
- 🚀 Features

- 🎯 Facebook and Instagram phishing templates
- 🌐 Cloudflared public link generation
- 📱 Mobile-friendly design (perfect for mobile testing)
- 🔓 Credential logging with IP and User-Agent
- 📦 Works in Termux and Linux
- 📄 Clean logs and customizable phishing pages
- # 1. Update & install required packages
- pkg update && pkg upgrade
- pkg install git php openssh curl wget -y

# 2. Install Cloudflared (for public links)
pkg install cloudflared -y

# 3. Clone KD Phishing repository
git clone https://github.com/Ali-Hamza-01202/KD-Phishing
cd KD-Phishing

# 4. Make the main script executable
chmod +x kdphish.sh
# 3. To Launch
./kdphish.sh
