#!/usr/bin/env bash
# source: https://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/
echo "Press CTRL+C to proceed."
trap "pkill -f 'sleep 1h'" INT
trap "set +x ; sleep 1h ; set -x" DEBUG

# YOUR CODE HERE 
# To stop the script you would have to kill it from another shell 
# sudo apt update 
# sudo apt upgrade
mkdir -p ~/tmp/test
printf '%s\n' 'first line' 'second line' 'third line' > ~/tmp/test/file.printf
cat ~/tmp/test/file.printf
