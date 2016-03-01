#!/bin/bash
targets="I all and animal ashes at back bad bark because"
for target in $targets; do
  t=$(time curl -s "http://127.0.0.1:8000/meaning/$target/cognateclasslist/" -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,de;q=0.6' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://127.0.0.1:8000/meanings/' -H 'Cookie: djdt=hide; csrftoken=N5KX4dJjTnnnnZEL4zDw8d88r0hOFVDD; sessionid=uedshgo83qk60r99rlbjmewwo9v6edt2' -H 'Connection: keep-alive' --compressed > /dev/null)
  echo "Time for $target:\n$t"
done
