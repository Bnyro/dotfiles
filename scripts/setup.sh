#!/usr/bin/bash

THEMESDIR=/usr/share/themes
ICONSDIR=/usr/share/icons
GRUBDIR=/boot/grub/themes

has() {
	(command -v "$1" &>/dev/null)
}

installtheme() {
	THEMEDIR=~/.themes/
	VERSION="Catppuccin-Mocha-Standard-Rosewater-Dark"
	mkdir -p $THEMEDIR
	wget "https://github.com/catppuccin/gtk/releases/latest/download/$VERSION.zip" \
		-P $THEMEDIR
	cd $THEMEDIR
	unzip $VERSION.zip
	rm -rf $VERSION.zip
	mkdir -p "$HOME/.config/gtk-4.0"
	ln -sf "$THEMEDIR/gtk-4.0/assets" "$HOME/.config/gtk-4.0/assets"
	ln -sf "$THEMEDIR/gtk-4.0/gtk.css" "$HOME/.config/gtk-4.0/gtk.css"
	ln -sf "$THEMEDIR/gtk-4.0/gtk-dark.css" "$HOME/.config/gtk-4.0/gtk-dark.css"
}

installgrub() {
	git clone --depth 1 https://gitlab.com/VandalByte/darkmatter-grub-theme.git
	cd darkmatter-grub-theme
	sudo python3 darkmatter-theme.py --install
}

getdotfiles() {
	git clone git@github.com:Bnyro/dotfiles.git
	rm -rf ~/.config
	mv dotfiles ~/.config
}

installwalls() {
	cd /usr/share/backgrounds
	sudo git clone "https://gitlab.com/garuda-linux/themes-and-settings/artwork/garuda-wallpapers"
	sudo git clone "https://github.com/D3Ext/aesthetic-wallpapers"
	sudo git clone "https://github.com/Gingeh/wallpapers" "catppuccin-wallpapers"
	cd -
}

installui() {
	installtheme
	getdotfiles
	installgrub
	installwalls
}

installapps() { # apps
	for app in $1; do
		if ! has "$app"; then
			sudo xbps-install -Sy "$app" || echo "Failed to install $app"
		fi
		[ $? != 0 ] && echo "Failed to install $app"
	done
}

installnode() { # packages
	for pkg in $1; do
		sudo npm install -g "$pkg"
	done
}

config() {
	# install bfetch & bnyro
	./bnyro selfinstall
	# enable sudo warning forever
	echo "Defaults	lecture = always" | sudo tee /etc/sudoers.d/privacy
	# set bash as default shell
	chsh -s $(which bash)
	sudo chsh -s $(which bash)
	sudo sed -i 's/bash/bash/g' /etc/default/useradd
	# install ble.sh
	BLESH_URL=$(curl -s "https://api.github.com/repos/akinomyoga/ble.sh/releases/latest" |
		jq -r ".assets[0].browser_download_url")
	BLESH_BASE=$(basename "$BLESH_URL" ".tar.xz")
	wget "$BLESH_URL"
	tar xvf "$BLESH_BASE.tar.xz"
	mv "$BLESH_BASE" ~/blesh
	echo ". ~/config/bash/config.sh" >>~/.bashrc
}

rustinstall() { # git repo url, program name from Cargo.toml
	git clone "$1"
	REPO_NAME=$(basename "$1" .git)
	cd "$REPO_NAME"
	cargo build --release
	sudo mv "target/release/$2" "/usr/local/bin/"
	cd ..
	rm -rf "$REPO_NAME"
}

rs_programs() {
	rustinstall "https://github.com/Bnyro/serve-rs.git" serve
	rustinstall "https://github.com/Bnyro/get-rs.git" get
	rustinstall "https://github.com/Bnyro/rename-rs.git" rn
}

PKGS="$(cat packages.txt)"
NODE="$(cat node.txt)"

case ${1} in
--theme)
	installui
	;;
--walls)
	installwalls
	;;
--config)
	config
	;;
--rust)
	rs_programs
	;;
*)
	installapps "$PKGS"
	installnode "$NODE"
	installui
	rs_programs
	config
	;;
esac
