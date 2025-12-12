# VPS: Instalar Node, Nginx y SSL

Guía rápida para Ubuntu 22.04/24.04 con dominio `live.ijccrl.com` y backend en `127.0.0.1:8080`.

## 1) Actualiza y firewall
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status
```

## 2) Instala Node.js (18+)
```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs build-essential
node -v
npm -v
```

## 3) Clona y prepara el servidor Node
```bash
cd /opt
sudo git clone https://github.com/ijccrl/ijccrl-live-arena.git
cd ijccrl-live-arena/server
npm install
# Ejecuta tu servicio (ejemplo con PM2)
sudo npm install -g pm2
pm2 start index.js --name ijccrl-node -- --port 8080 --host 127.0.0.1
pm2 save
pm2 startup systemd
```

## 4) Instala Nginx + Certbot
```bash
sudo apt install -y nginx
sudo apt install -y certbot python3-certbot-nginx
```

## 5) Configura Nginx
```bash
sudo mkdir -p /var/www/live.ijccrl.com
sudo cp -r /opt/ijccrl-live-arena/web/* /var/www/live.ijccrl.com/
sudo cp /opt/ijccrl-live-arena/nginx/live.ijccrl.com.conf /etc/nginx/sites-available/live.ijccrl.com.conf
sudo ln -s /etc/nginx/sites-available/live.ijccrl.com.conf /etc/nginx/sites-enabled/live.ijccrl.com.conf
sudo nginx -t
sudo systemctl reload nginx
```

## 6) Certificados SSL
```bash
sudo certbot --nginx -d live.ijccrl.com --redirect --email tu-correo@example.com --agree-tos
sudo systemctl reload nginx
```

## 7) Verificación rápida
```bash
curl -I http://127.0.0.1:8080/ijccrl-viewer.html
curl -I https://live.ijccrl.com/ijccrl-viewer.html
sudo nginx -t
```

Con esto tendrás Nginx sirviendo el visor y haciendo proxy seguro al backend Node en `127.0.0.1:8080`.
