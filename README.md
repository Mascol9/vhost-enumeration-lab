# VHost Enumeration Lab

A simple lab for testing virtual host enumeration techniques.

## 🎯 Features

- **8 Hidden VHosts** with different response types
- **Docker-based setup** for easy deployment
- **Multiple response codes**: 200, 403, 404, 500, 301 redirects
- **Ready for popular tools**: gobuster, ffuf, dirb, etc.
- **Educational content** with realistic scenarios

## 🚀 Quick Start

```bash
./start.sh
```

The lab starts and runs in the terminal. Press `Ctrl+C` to stop it.

## 📋 Prerequisites

- Docker
- Git (for cloning)
- Penetration testing tools (optional):
  - gobuster
  - ffuf
  - dirb
  - SecLists wordlists

## 🧪 Testing

Once the lab is running on `http://localhost:8081`, test the hidden vhosts:

```bash
# Hidden vhosts to discover
curl -H "Host: admin.test.local" http://localhost:8081/
curl -H "Host: internal.test.local" http://localhost:8081/
curl -H "Host: api.test.local" http://localhost:8081/
curl -H "Host: forbidden.test.local" http://localhost:8081/
curl -H "Host: redirect.test.local" http://localhost:8081/
curl -H "Host: secure.test.local" http://localhost:8081/
```

## 🎯 Enumeration Techniques

Use tools like:

```bash
# With gobuster
gobuster vhost -u http://localhost:8081 -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt

# With ffuf
ffuf -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -u http://localhost:8081 -H "Host: FUZZ.test.local"

# With dirb
dirb http://localhost:8081 -H "Host: admin.test.local"
```

## 📂 Configured VHosts

### Public
- `a.test.local` - Public VHost A
- `b.test.local` - Public VHost B

### Hidden (targets)
- `admin.test.local` - Admin panel (200)
- `internal.test.local` - Internal system (200)
- `api.test.local` - API endpoint (200)
- `forbidden.test.local` - Protected area (403)
- `redirect.test.local` - Redirect (301)
- `secure.test.local` - Secure area (200)
- `notfound.test.local` - Missing content (404)
- `error.test.local` - Server error (500)

### Default
- `default.test.local` - Catches non-matching requests

## 🛠️ Development

### Building manually
```bash
docker build -t vhost-lab .
docker run --rm -p 8081:80 vhost-lab
```

### Project Structure
```
vhost-lab/
├── Dockerfile          # Docker configuration
├── httpd.conf          # Apache main configuration
├── vhosts.conf         # Virtual host definitions
├── start.sh            # Lab startup script
├── sites/              # Web content for each vhost
│   ├── admin/          # Admin panel
│   ├── internal/       # Internal system
│   ├── api/            # API endpoint
│   └── ...             # Other vhosts
└── README.md           # This file
```

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