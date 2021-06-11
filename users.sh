#!/bin/bash

clear

for line in $(cat /etc/passwd | grep "/bin/bash" | cut -d ":" -f 1)
do
        if ! grep -q $line users.txt && ! grep -q $line admins.txt
        then
                echo $line
        fi
done

for line in $(cat /home/(user)/users.txt)
do
        echo -e "Cyberpatriot123\nCyberpatriot123" | passwd $line
done

for line in $(cat /home/(user)/admins.txt)
do
        echo -e "Cyberpatriot123\nCyberpatriot123" | passwd $line
done

for line in $(cat /home/(user)/users.txt)
do
        if ! grep -q $line /etc/passwd 
        then
                echo $line
        fi
done

for line in $(cat /home/(user)/admins.txt)
do
        if ! grep -q $line /etc/passwd
        then
                echo $line
        fi
done

for line in $(cat /home/(user)/users.txt)
do
        chage -M 15 -m 6 -W 7 -I 5 $line
done

for line in $(cat /home/(user)/admins.txt)
do
        chage -M 15 -m 6 -W 7 -I 5 $line
done

sudo passwd -l root

