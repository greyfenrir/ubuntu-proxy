f="/usr/bin/cy" bash -c 'echo -e "wget yandex.ru --no-check-certificate -q &&  echo \"ok\" || echo \"fail\"" > ${f}; chmod +x ${f}'
f="/usr/bin/cm" bash -c 'echo -e "wget mail.ru --no-check-certificate -q &&  echo \"ok\" || echo \"fail\"" > ${f}; chmod +x ${f}'
/etc/init.d/squid start
