

# IJCCRL LIVE ARENA

**Real-time Chess Engine Broadcasting with WinBoard, TLCS & Node.js**

IJCCRL LIVE ARENA is a complete, production-ready system for broadcasting **live chess engine games** from **WinBoard + TLCS (Tom’s Live Chess Server)** to a **modern web viewer**, using **Node.js, Socket.IO and Nginx**.

This project is the official live broadcasting infrastructure used by **IJCCRL (International Jurisdiction Chess Computer Rating Lists)**.

🌐 Live example:
👉 [https://live.ijccrl.com/ijccrl-viewer.html?port=16000](https://live.ijccrl.com/ijccrl-viewer.html?port=16000)

---

## ✨ Features

* Live board updates from **WinBoard / TLCS**
* Real-time engine data: **depth, evaluation, PV**
* **Estimated clocks** (TLCS-based, smooth and continuous)
* WebSocket-based live delivery (Socket.IO)
* Reverse-proxied via **Nginx + HTTPS**
* Works with **Stockfish-derived and original engines**
* Designed for **engine tournaments and rating lists**

---

## 🧱 System Architecture

```
[ Windows Host ]
 WinBoard
    │
    │  (ICS protocol)
    ▼
 TLCS (Tom’s Live Chess Server)
    │
    │  TCP / ICS
    ▼
[ VPS ]
 node-tlcv (Node.js + Socket.IO)  →  :8080
    │
    │  Reverse proxy
    ▼
 Nginx + SSL (Let's Encrypt)
    │
    ▼
 Web Viewer (Browser)
```

**Important:**
TLCS and WinBoard run on **Windows**, while the web server runs on a **Linux VPS**.

---

## 📁 Repository Structure

```
ijccrl-live-arena/
├── server/                  # Node.js (node-tlcv)
├── web/
│   └── ijccrl-viewer.html   # Final IJCCRL web viewer
├── windows/
│   ├── start-winboard-tlcs.bat
│   ├── server.ini.example
│   └── README-windows.md
├── nginx/
│   └── live.ijccrl.com.conf
├── docs/
│   ├── 00-architecture.md
│   ├── 01-windows-tlcs-winboard.md
│   ├── 02-vps-install-node-nginx-ssl.md
│   └── 03-troubleshooting.md
└── README.md
```

---

## 🪟 Windows Setup (WinBoard + TLCS)

### Requirements

* Windows 10 / 11
* WinBoard 4.4.x
* TLCS (`tlc_server16a.exe`)
* Chess engines (UCI)

> **TLCS and WinBoard binaries are NOT included**
> You must obtain them from their official sources.

### Key Files

* `windows/start-winboard-tlcs.bat`
* `windows/server.ini.example`

These files define:

* ICS mode
* Broadcast port (e.g. `16000`)
* Debug logging
* Engine pairing

📖 See: `windows/README-windows.md`

---

## 🌐 VPS Setup (Node.js + Nginx)

### Requirements

* Ubuntu 22.04+ / 24.04
* Node.js 18+
* Nginx
* Certbot (Let’s Encrypt)

### Node server

The Node server listens on:

```
http://127.0.0.1:8080
```

It:

* Receives TLCS data
* Normalizes engine info
* Emits `state` / `update` events via Socket.IO

### Nginx Reverse Proxy

Example config included:

```
nginx/live.ijccrl.com.conf
```

Supports:

* HTTPS
* WebSockets
* Socket.IO upgrades
* No exposed backend ports

📖 Full guide: `docs/02-vps-install-node-nginx-ssl.md`

---

## 🖥️ Web Viewer

The main viewer is:

```
web/ijccrl-viewer.html
```

Features:

* Responsive chessboard
* Last-move highlighting
* Encapsulated PV / Board Eval panel
* Engine clocks (estimated, TLCS-based)
* Dark theme (IJCCRL branding)

Open a live game using:

```
https://live.ijccrl.com/ijccrl-viewer.html?port=16000
```

---

## ⏱️ About the Clocks

TLCS does **not** stream continuous clock ticks.

This project implements:

* **Estimated clocks**
* Updated on each engine message
* Smooth client-side countdown
* Clearly labeled as: `CLOCK: ESTIMATED (TLCS)`

This design is **intentional and transparent**.

---

## 🔒 Security Notes

* TLCS ports are **never exposed publicly**
* Only ports **80 / 443** are open on the VPS
* All traffic is HTTPS
* Nginx blocks `.env`, bots and scanners
* Reverse proxy isolates Node.js

---

## 🛠️ Troubleshooting

Common issues are documented in:

📄 `docs/03-troubleshooting.md`

Includes:

* 502 Bad Gateway (wrong upstream)
* Viewer connected but no moves
* TLCS not receiving games
* WinBoard not playing
* Socket.IO connection checks

---

## ⚖️ Licensing & Third-Party Software

This repository contains **only IJCCRL-authored code and configuration**.

Third-party components:

* **WinBoard** – external
* **TLCS (Tom’s Live Chess Server)** – external
* **Chess engines** – external

Users must comply with the respective licenses of those projects.

---

## 🏆 About IJCCRL

**IJCCRL** is an independent chess engine testing and rating organization, focused on:

* Bullet, Blitz and Long time controls
* Original and Stockfish-derived engines
* Transparency and reproducibility
* Public live broadcasts

🌍 [https://ijccrl.com](https://ijccrl.com)
📡 [https://live.ijccrl.com](https://live.ijccrl.com)

---

## 🚀 Roadmap

* Multi-board tournament overview
* Round scoreboard
* Improved evaluation graph
* Tournament presets (e.g. 16m+10s IJCCRL control)
* Public documentation website

---

**IJCCRL LIVE ARENA**
*Chess engine broadcasting, done right.*

---

Si quieres, en el siguiente paso puedo:

* adaptar este README a **SEO para tu web**
* crear el **LICENSE**
* escribir los **docs/** uno por uno
* o preparar el **README-windows.md** y **Troubleshooting** completos.
Perfecto. Aquí tienes un **README.md completo, profesional y listo para subir**, en **inglés**, alineado con el estándar que acabas de crear en **live.ijccrl.com** y pensado para convertirse en **documentación oficial IJCCRL**.

Puedes copiarlo **tal cual** como `README.md` en el nuevo repositorio.

---

# IJCCRL LIVE ARENA

**Real-time Chess Engine Broadcasting with WinBoard, TLCS & Node.js**

IJCCRL LIVE ARENA is a complete, production-ready system for broadcasting **live chess engine games** from **WinBoard + TLCS (Tom’s Live Chess Server)** to a **modern web viewer**, using **Node.js, Socket.IO and Nginx**.

This project is the official live broadcasting infrastructure used by **IJCCRL (International Jurisdiction Chess Computer Rating Lists)**.

🌐 Live example:
👉 [https://live.ijccrl.com/ijccrl-viewer.html?port=16000](https://live.ijccrl.com/ijccrl-viewer.html?port=16000)

---

## ✨ Features

* Live board updates from **WinBoard / TLCS**
* Real-time engine data: **depth, evaluation, PV**
* **Estimated clocks** (TLCS-based, smooth and continuous)
* WebSocket-based live delivery (Socket.IO)
* Reverse-proxied via **Nginx + HTTPS**
* Works with **Stockfish-derived and original engines**
* Designed for **engine tournaments and rating lists**

---

## 🧱 System Architecture

```
[ Windows Host ]
 WinBoard
    │
    │  (ICS protocol)
    ▼
 TLCS (Tom’s Live Chess Server)
    │
    │  TCP / ICS
    ▼
[ VPS ]
 node-tlcv (Node.js + Socket.IO)  →  :8080
    │
    │  Reverse proxy
    ▼
 Nginx + SSL (Let's Encrypt)
    │
    ▼
 Web Viewer (Browser)
```

**Important:**
TLCS and WinBoard run on **Windows**, while the web server runs on a **Linux VPS**.

---

## 📁 Repository Structure

```
ijccrl-live-arena/
├── server/                  # Node.js (node-tlcv)
├── web/
│   └── ijccrl-viewer.html   # Final IJCCRL web viewer
├── windows/
│   ├── start-winboard-tlcs.bat
│   ├── server.ini.example
│   └── README-windows.md
├── nginx/
│   └── live.ijccrl.com.conf
├── docs/
│   ├── 00-architecture.md
│   ├── 01-windows-tlcs-winboard.md
│   ├── 02-vps-install-node-nginx-ssl.md
│   └── 03-troubleshooting.md
└── README.md
```

---

## 🪟 Windows Setup (WinBoard + TLCS)

### Requirements

* Windows 10 / 11
* WinBoard 4.4.x
* TLCS (`tlc_server16a.exe`)
* Chess engines (UCI)

> **TLCS and WinBoard binaries are NOT included**
> You must obtain them from their official sources.

### Key Files

* `windows/start-winboard-tlcs.bat`
* `windows/server.ini.example`

These files define:

* ICS mode
* Broadcast port (e.g. `16000`)
* Debug logging
* Engine pairing

📖 See: `windows/README-windows.md`

---

## 🌐 VPS Setup (Node.js + Nginx)

### Requirements

* Ubuntu 22.04+ / 24.04
* Node.js 18+
* Nginx
* Certbot (Let’s Encrypt)

### Node server

The Node server listens on:

```
http://127.0.0.1:8080
```

It:

* Receives TLCS data
* Normalizes engine info
* Emits `state` / `update` events via Socket.IO

### Nginx Reverse Proxy

Example config included:

```
nginx/live.ijccrl.com.conf
```

Supports:

* HTTPS
* WebSockets
* Socket.IO upgrades
* No exposed backend ports

📖 Full guide: `docs/02-vps-install-node-nginx-ssl.md`

---

## 🖥️ Web Viewer

The main viewer is:

```
web/ijccrl-viewer.html
```

Features:

* Responsive chessboard
* Last-move highlighting
* Encapsulated PV / Board Eval panel
* Engine clocks (estimated, TLCS-based)
* Dark theme (IJCCRL branding)

Open a live game using:

```
https://live.ijccrl.com/ijccrl-viewer.html?port=16000
```

---

## ⏱️ About the Clocks

TLCS does **not** stream continuous clock ticks.

This project implements:

* **Estimated clocks**
* Updated on each engine message
* Smooth client-side countdown
* Clearly labeled as: `CLOCK: ESTIMATED (TLCS)`

This design is **intentional and transparent**.

---

## 🔒 Security Notes

* TLCS ports are **never exposed publicly**
* Only ports **80 / 443** are open on the VPS
* All traffic is HTTPS
* Nginx blocks `.env`, bots and scanners
* Reverse proxy isolates Node.js

---

## 🛠️ Troubleshooting

Common issues are documented in:

📄 `docs/03-troubleshooting.md`

Includes:

* 502 Bad Gateway (wrong upstream)
* Viewer connected but no moves
* TLCS not receiving games
* WinBoard not playing
* Socket.IO connection checks

---

## ⚖️ Licensing & Third-Party Software

This repository contains **only IJCCRL-authored code and configuration**.

Third-party components:

* **WinBoard** – external
* **TLCS (Tom’s Live Chess Server)** – external
* **Chess engines** – external

Users must comply with the respective licenses of those projects.

---

## 🏆 About IJCCRL

**IJCCRL** is an independent chess engine testing and rating organization, focused on:

* Bullet, Blitz and Long time controls
* Original and Stockfish-derived engines
* Transparency and reproducibility
* Public live broadcasts

🌍 [https://ijccrl.com](https://ijccrl.com)
📡 [https://live.ijccrl.com](https://live.ijccrl.com)

---

## 🚀 Roadmap

* Multi-board tournament overview
* Round scoreboard
* Improved evaluation graph
* Tournament presets (e.g. 16m+10s IJCCRL control)
* Public documentation website

---

**IJCCRL LIVE ARENA**
*Chess engine broadcasting, done right.*

---

Si quieres, en el siguiente paso puedo:

* adaptar este README a **SEO para tu web**
* crear el **LICENSE**
* escribir los **docs/** uno por uno
* o preparar el **README-windows.md** y **Troubleshooting** completos.

