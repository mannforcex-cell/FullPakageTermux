#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════════════════════
#  ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗
#  ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝
#     ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ 
#     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ 
#     ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ╚██╗
#     ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝   ╚═╝
#  SCRIPT INSTALL SEMUA PACKAGE TERMUX
#  Pembuat: Development Man Force X
#  Author Original: Dark Force
#  Description: Script untuk install semua package Termux dalam Bahasa Malaysia
# ═══════════════════════════════════════════════════════════════════════════════

# Warna-warni
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Fungsi-fungsi
print_banner() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║     ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗    ║"
    echo "║     ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝    ║"
    echo "║        ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝     ║"
    echo "║        ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗     ║"
    echo "║        ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ╚██╗   ║"
    echo "║        ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝   ╚═╝   ║"
    echo "║              SCRIPT INSTALL SEMUA PACKAGE                    ║"
    echo "║              Development Man Force X                         ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_section() {
    echo -e "\n${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}[*] $1${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}\n"
}

print_success() {
    echo -e "${GREEN}[✓] $1${NC}"
}

print_error() {
    echo -e "${RED}[✗] $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}[!] $1${NC}"
}

print_info() {
    echo -e "${CYAN}[i] $1${NC}"
}

install_package() {
    local package=$1
    echo -e "${BLUE}[→] Memasang: ${WHITE}$package${NC}"
    pkg install -y $package > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        print_success "$package berjaya dipasang"
    else
        print_error "Gagal memasang $package"
    fi
}

# Mula Script
print_banner

echo -e "${YELLOW}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Script ni akan install SEMUA package Termux yang popular   ║"
echo "║  Pastikan korang ada internet yang stable                   ║"
echo "║  Proses ni ambil masa yang lama, sabar ye                  ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

read -p "$(echo -e ${CYAN}[?] Nak teruskan install? [y/n]: ${NC})" confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    print_warning "Install batal."
    exit 0
fi

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 1: Setup Storage & Update Repository
# ═══════════════════════════════════════════════════════════════════════════════
print_section "SETUP STORAGE & UPDATE REPOSITORY"

print_info "Setup kebenaran storage..."
termux-setup-storage

print_info "Update repository package..."
pkg update -y && pkg upgrade -y
print_success "Repository dah update!"

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 2: Essential Packages
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG PACKAGE PENTING"

ESSENTIAL_PACKAGES=(
    "coreutils"
    "curl"
    "wget"
    "git"
    "openssh"
    "openssl"
    "zip"
    "unzip"
    "tar"
    "nano"
    "vim"
    "neovim"
    "tmux"
    "screen"
    "htop"
    "ncdu"
    "tree"
    "man"
    "less"
    "grep"
    "sed"
    "awk"
    "bc"
    "jq"
    "pv"
    "file"
)

for pkg in "${ESSENTIAL_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 3: Programming Languages
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG BAHASA PROGRAMMING"

PROGRAMMING_PACKAGES=(
    "python"
    "python-pip"
    "nodejs"
    "nodejs-lts"
    "ruby"
    "php"
    "perl"
    "lua54"
    "golang"
    "rust"
    "clang"
    "make"
    "cmake"
    "pkg-config"
    "gdb"
    "llvm"
    "ndk-multilib"
)

for pkg in "${PROGRAMMING_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 4: Networking Tools
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG TOOLS NETWORK"

NETWORK_PACKAGES=(
    "nmap"
    "netcat-openbsd"
    "dnsutils"
    "iproute2"
    "traceroute"
    "whois"
    "tcpdump"
    "tshark"
    "hydra"
    "sqlmap"
    "nikto"
    "aircrack-ng"
    "ettercap"
    "net-tools"
    "proxychains-ng"
    "tor"
    "torsocks"
    "socat"
    "mtr"
    "iperf3"
    "speedtest-go"
    "aria2"
    "axel"
)

for pkg in "${NETWORK_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 5: Security & Hacking Tools
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG TOOLS SECURITY & HACKING"

SECURITY_PACKAGES=(
    "hashcat"
    "john"
    "crunch"
    "wordlists"
    "metasploit"
    "radare2"
    "binwalk"
    "steghide"
    "exiftool"
    "foremost"
    "apktool"
    "dex2jar"
    "jadx"
    "nuclei"
    "subfinder"
    "httpx"
    "ffuf"
    "gobuster"
    "wfuzz"
    "masscan"
    "amass"
    "fierce"
)

for pkg in "${SECURITY_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 6: Development Tools
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG TOOLS DEVELOPMENT"

DEV_PACKAGES=(
    "libffi"
    "libjpeg-turbo"
    "libpng"
    "libxml2"
    "libxslt"
    "freetype"
    "sqlite"
    "mariadb"
    "postgresql"
    "redis"
    "mongodb"
    "libbz2"
    "zlib"
    "readline"
    "ncurses"
    "libevent"
)

for pkg in "${DEV_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 7: Media & Graphics
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG PACKAGE MEDIA & GRAPHICS"

MEDIA_PACKAGES=(
    "ffmpeg"
    "imagemagick"
    "graphicsmagick"
    "sox"
    "opus-tools"
    "lame"
    "flac"
    "vorbis-tools"
    "youtube-dl"
    "yt-dlp"
    "gallery-dl"
    "mpv"
    "feh"
    "chafa"
    "cmatrix"
    "figlet"
    "toilet"
    "cowsay"
    "lolcat"
    "neofetch"
    "screenfetch"
    "sl"
)

for pkg in "${MEDIA_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 8: Text Processing & Documentation
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG PACKAGE TEXT PROCESSING"

TEXT_PACKAGES=(
    "pandoc"
    "texlive-bin"
    "groff"
    "asciidoc"
    "markdown"
    "hugo"
    "pelican"
    "fd"
    "fzf"
    "ripgrep"
    "ag"
    "bat"
    "exa"
    "lsd"
    "ranger"
    "mc"
    "nnn"
    "vifm"
)

for pkg in "${TEXT_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 9: Web Frameworks & Servers
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG WEB FRAMEWORKS & SERVERS"

WEB_PACKAGES=(
    "nginx"
    "apache2"
    "lighttpd"
    "php-fpm"
    "php-apache"
    "php-pgsql"
    "php-sodium"
    "composer"
    "npm"
    "yarn"
)

for pkg in "${WEB_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 10: Python Libraries (Popular)
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG PYTHON LIBRARIES POPULAR"

print_info "Upgrading pip..."
pip install --upgrade pip > /dev/null 2>&1

PYTHON_PACKAGES=(
    "requests"
    "beautifulsoup4"
    "selenium"
    "pandas"
    "numpy"
    "matplotlib"
    "flask"
    "django"
    "fastapi"
    "uvicorn"
    "aiohttp"
    "httpx"
    "scrapy"
    "Pillow"
    "opencv-python"
    "cryptography"
    "pycryptodome"
    "paramiko"
    "fabric"
    "boto3"
    "google-api-python-client"
    "tweepy"
    "telethon"
    "pyrogram"
    "python-telegram-bot"
    "discord.py"
    "colorama"
    "rich"
    "tqdm"
    "click"
    "typer"
    "pyfiglet"
    "phonenumbers"
    "shodan"
    "censys"
    "twilio"
)

for pkg in "${PYTHON_PACKAGES[@]}"; do
    echo -e "${BLUE}[→] Memasang Python: ${WHITE}$pkg${NC}"
    pip install $pkg > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        print_success "$pkg berjaya dipasang"
    else
        print_error "Gagal memasang $pkg"
    fi
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 11: Node.js Packages (Popular)
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG NODE.JS PACKAGES POPULAR"

NODE_PACKAGES=(
    "express"
    "axios"
    "cheerio"
    "puppeteer"
    "playwright"
    "socket.io"
    "nodemon"
    "pm2"
    "typescript"
    "eslint"
    "prettier"
    "@adiwajshing/baileys"
    "whatsapp-web.js"
    "telegraf"
    "grammy"
    "discord.js"
    "mongoose"
    "prisma"
    "sequelize"
    "sharp"
    "jimp"
    "fluent-ffmpeg"
    "node-fetch"
    "chalk"
    "ora"
    "inquirer"
    "commander"
    "yargs"
)

for pkg in "${NODE_PACKAGES[@]}"; do
    echo -e "${BLUE}[→] Memasang Node.js: ${WHITE}$pkg${NC}"
    npm install -g $pkg > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        print_success "$pkg berjaya dipasang"
    else
        print_error "Gagal memasang $pkg"
    fi
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 12: Miscellaneous & Fun Packages
# ═══════════════════════════════════════════════════════════════════════════════
print_section "MEMASANG PACKAGE LAIN-LAIN"

MISC_PACKAGES=(
    "termux-api"
    "termux-tools"
    "termux-services"
    "termux-auth"
    "proot"
    "proot-distro"
    "tsu"
    "w3m"
    "lynx"
    "elinks"
    "irssi"
    "weechat"
    "finch"
    "mutt"
    "newsboat"
    "calcurse"
    "taskwarrior"
    "pass"
    "gnupg"
    "pinentry"
)

for pkg in "${MISC_PACKAGES[@]}"; do
    install_package "$pkg"
done

# ═══════════════════════════════════════════════════════════════════════════════
# LANGKAH 13: Final Cleanup
# ═══════════════════════════════════════════════════════════════════════════════
print_section "CLEANUP AKHIR"

print_info "Buang cache..."
pkg clean
apt autoremove -y > /dev/null 2>&1

# ═══════════════════════════════════════════════════════════════════════════════
# COMPLETION
# ═══════════════════════════════════════════════════════════════════════════════
echo ""
echo -e "${GREEN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║       ███████╗██╗   ██╗ ██████╗ ██████╗███████╗███████╗      ║"
echo "║       ██╔════╝██║   ██║██╔════╝██╔════╝██╔════╝██╔════╝      ║"
echo "║       ███████╗██║   ██║██║     ██║     █████╗  ███████╗      ║"
echo "║       ╚════██║██║   ██║██║     ██║     ██╔══╝  ╚════██║      ║"
echo "║       ███████║╚██████╔╝╚██████╗╚██████╗███████╗███████║      ║"
echo "║       ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝╚══════╝╚══════╝      ║"
echo "║                                                              ║"
echo "║            INSTALL DAH SIAP! Semua package dah install!      ║"
echo "║                    Development Man Force X                   ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

print_info "Terima kasih guna script ni!"
print_info "Restart Termux untuk apply semua perubahan."
echo ""