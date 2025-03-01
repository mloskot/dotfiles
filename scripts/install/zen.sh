#!/bin/bash
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

VERSION=$(curl -s "https://api.github.com/repos/zen-browser/desktop/releases/latest" | grep -Po '"tag_name": "\K[0-9a-z.]+')
if [ -d /opt/zen ]; then
    if /opt/zen/zen --version | grep "${VERSION}" ; then
        echo "zen ${VERSION} already installed:"
        /opt/zen/zen --version
        echo "Skipping"
    fi
fi

#curl -Lo zen.tar.xz "https://github.com/zen-browser/desktop/releases/download/${VERSION}/zen.linux-x86_64.tar.xz"
#sudo tar -C /opt -xf zen.tar.xz
#rm -f zen.tar.xz

sudo tee "${HOME}/.local/share/applications/zen.desktop" << EOF > /dev/null
[Desktop Entry]
Version=1.0
Name=Zen Browser
Comment=Experience tranquillity while browsing the web without people tracking you!
GenericName=Web Browser
Categories=GNOME;GTK;Network;WebBrowser;
Keywords=Internet;WWW;Browser;Web;Explorer
TryExec=/opt/zen/zen
Icon=/opt/zen/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
X-MultipleArgs=false
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
EOF
