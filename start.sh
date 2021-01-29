#!/bin/bash
clear

echo "Cleaning tmux sessions"
tmux kill-server
# THIS SCRIPT IS ORIGINALLY FROM VARKARIA #
echo "Starting MYSQL"
sudo service mysql restart
echo "Starting Nginx"
pkill nginx
nginx

# Session Name
session="gulag"
session2="gulag-web"

# Start New Session with our name
echo "Creating Sessions"
tmux new-session -d -s $session
tmux new-session -d -s $session2

echo "Stating Sessions"
tmux send-keys -t $session 'cd gulag && python3.9 main.py' C-m
tmux send-keys -t $session2 'cd gulag-web && python3.9 main.py' C-m

echo "Server Has Started | Have fun : )"

