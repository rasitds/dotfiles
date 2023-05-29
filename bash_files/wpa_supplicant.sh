sudo ip link set wlp2s0 up
wpa_passphrase name pass | sudo wpa_supplicant -B -i wlp2s0 -c /dev/stdin
sudo dhcpcd wlp2s0
