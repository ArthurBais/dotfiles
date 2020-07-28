#!/bin/sh

pgrep -x redshift > /dev/null && echo "💡" || echo "😭"
