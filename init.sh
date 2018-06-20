f="/usr/bin/cy" bash -c 'echo -e "wget yandex.ru --no-check-certificate -q &&  echo \"ok\" || echo \"fail\"" > ${f}; chmod +x ${f}'
f="/usr/bin/cm" bash -c 'echo -e "wget mail.ru --no-check-certificate -q &&  echo \"ok\" || echo \"fail\"" > ${f}; chmod +x ${f}'
echo
/etc/init.d/squid start 2>&1 > /dev/null
iptables -t nat -A OUTPUT -p tcp -m owner ! --uid-owner proxy --dport 80 -j REDIRECT --to-port 3128 && iptables -t nat -A OUTPUT -p tcp -m owner ! --uid-owner proxy --dport 443 -j REDIRECT --to-port 3128

echo "USERS:"
echo "DAD: export {http,https}_proxy='http://dad:d@localhost:3128'"
echo "KID: export {http,https}_proxy='http://kid:k@localhost:3128'"
echo
echo "CHECKERS"
echo "cm: check mail"
echo "cy: check yandex"
