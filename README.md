# VHost Enumeration Lab

A simple lab for testing virtual host enumeration techniques.

## 🚀 Quick Start

```bash
./start.sh
```

The lab starts and runs in the terminal. Press `Ctrl+C` to stop it.

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