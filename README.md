# VHost Enumeration Lab

A simple lab for testing virtual host enumeration techniques.

## 🎯 Features

- **8 Hidden VHosts** with different response types
- **Docker-based setup** for easy deployment
- **Multiple response codes**: 200, 403, 404, 500, 301 redirects
- **Ready for popular tools**: ffuf, gobuster, etc.

## 🚀 Quick Start

```bash
./start.sh
```

The lab starts and runs in the terminal. Press `Ctrl+C` to stop it.

**Note:** The lab automatically finds an available port starting from 13100. The actual port will be displayed when the lab starts.

## 📋 Prerequisites

- Docker
- Git (for cloning)
- Penetration testing tools (optional):
  - gobuster
  - ffuf
  - SecLists wordlists

## 🧪 Testing

Once the lab is running (port will be shown in startup message), test the hidden vhosts:

## 🎯 Enumeration Techniques

Use tools like:

```bash
# With gobuster (replace PORT with actual port)
gobuster vhost -u http://localhost:PORT -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt

# With ffuf (replace PORT with actual port)
ffuf -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -u http://localhost:PORT -H "Host: FUZZ.test.local"

```
### Default
- `default.test.local` - Catches non-matching requests



## 🤝 Contributing

Feel free to contribute by:
- Adding new vhost scenarios
- Improving documentation
- Adding new enumeration techniques
- Reporting issues

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimer

This lab is for educational purposes only. Use only on systems you own or have explicit permission to test.
