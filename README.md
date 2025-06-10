# Kodish Pack Installer

Instalador automático para configurar um sistema Ubuntu 24.04 LTS com os principais programas, codecs, ferramentas e ajustes essenciais. Ideal para quem prefere Flatpak ao Snap.

## 🚀 Recursos principais

- Atualiza e prepara o Ubuntu 24.04
- Instala utilitários e apps via `apt`:
  - VLC, Audacious, SMPlayer, GIMP, Handbrake
  - GParted, qbittorrent, GDebi, TLP, codecs
- Instala aplicativos via `Flatpak` (Flathub):
  - Spotify, Lutris, PlayOnLinux, Stremio, Firefox
- Remove completamente o Snap e bloqueia reinstalação
- Instala o Google Chrome manualmente via `.deb`
- Interface amigável com barra de progresso (20 etapas)

## ✅ Compatível com

- Ubuntu 24.04 LTS (Noble Numbat)
- Derivados com suporte a `apt`, `flatpak`, e interface GNOME

## 📦 Requisitos

- Acesso root (`sudo`)
- Conexão com a internet
- Flatpak habilitado (o script cuida disso também)

## 🛠️ Como usar

1. Baixe o script:
   ```bash
   git clone https://github.com/seuusuario/kodish-pack.git
   cd kodish-pack



