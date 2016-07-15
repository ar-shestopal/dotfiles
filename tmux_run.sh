#!/bin/bash

SESSION1=job
SESSION2=daemons

SESSION1_PATH=$HOME/job/GlobalLogic/tmportal

kill -9 $(ps aux | grep 'redis'   | awk '{print $2}')
kill -9 $(ps aux | grep 'rails s' | awk '{print $2}')
kill -9 $(ps aux | grep 'rails c' | awk '{print $2}')

kill -9 $(ps aux | grep 'faye' | awk '{print $2}')

tmux -2 new-session -c $SESSION1_PATH -s $SESSION1 -d
tmux select-pane -t 0
tmux new-window -t $SESSION1:1 -n console -c $SESSION1_PATH
tmux new-window -t $SESSION1:2 -n server -c $SESSION1_PATH
tmux new-window -t $SESSION1:3 -n faye -c $SESSION1_PATH
tmux new-window -t $SESSION1:4 -n redis -c $SESSION1_PATH
tmux select-window -t $SESSION1:4
tmux send-keys 'redis-server' C-m
tmux select-window -t $SESSION1:3
tmux send-keys 'bundle exec ruby faye.rb' C-m
tmux select-window -t $SESSION1:2
tmux send-keys 'rails s' C-m
tmux select-window -t $SESSION1:1
tmux send-keys 'rails c' C-m
tmux select-window -t $SESSION1:0
tmux send-keys 'vim' C-m

tmux attach-session -t $SESSION1
