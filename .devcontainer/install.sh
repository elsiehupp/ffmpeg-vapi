# apt update && apt upgrade -y
apt install meson libglib2.0-dev valac -y
# apt-get -y autoremove
# apt-get autoclean

# cd /workspaces
# git clone https://github.com/vala-lang/vala-language-server.git --depth 1
# cd vala-language-server
# meson -Dprefix=/usr build
# ninja -C build
# sudo ninja -C build install
add-apt-repository ppa:elementary-os/stable
apt update
apt install vala-language-server