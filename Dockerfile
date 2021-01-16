# escape=`
from danielguerra/ubuntu-xrdp

# remove un-used softwares
run apt remove -y `
firefox

# chinese and common tools
run apt install -y `
chromium-browser `
language-pack-zh* `
fonts-arphic-ukai `
ibus `
ibus-sunpinyin `
htop `
iputils-ping

# brave browser
run apt install -y apt-transport-https curl gnupg
run curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
run echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
run apt update -y
run apt install -y brave-browser

# shortcuts
run xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Primary><Alt>t" -s "xfce4-terminal" -t string `
&& xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/Super_L" -s "xfce4-appfinder" -t string

add scripts /entrypoint
run chmod -R +x /entrypoint
entrypoint ["/entrypoint/run.sh"]
