#!/bin/sh

echo 📰$(newsboat -x print-unread | cut -d" " -f1 | sed "s/.\{3,\}/99+/")
# echo $(newsboat -x print-unread | awk '{print $1}' | sed "s/.\{3,\}/99+/")📰
