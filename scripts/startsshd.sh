#!/bin/bash
/usr/sbin/sshd-keygen -A
/usr/sbin/sshd -D &
#取消pam限制
#sed -ri 's/session required pam_loginuid.so/#session required pam_loginuid.so/g' /etc/pam.d/sshd
