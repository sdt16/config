
export http_proxy=http://proxy.cle.ms.philips.com:8080
export https_proxy=http://proxy.cle.ms.philips.com:8080
export HTTP_PROXY=http://proxy.cle.ms.philips.com:8080
export HTTPS_PROXY=http://proxy.cle.ms.philips.com:8080

autocutsel -fork &
autocutsel -selection PRIMARY -fork &
urxvtd -q -f -o &
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr &
xrdb ~/.Xdefaults &
chromium &
xcompmgr &
~/.fehbg
xmonad

