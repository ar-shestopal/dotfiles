#!/bin/bash

SESSION1=job
SESSION2=daemons

tmux -2 new-session -c ~/job/TrackR -s $SESSION1 -d
tmux select-pane -t 0
tmux new-window -t $SESSION1:1 -n console
tmux new-window -t $SESSION1:2 -n server
tmux new-window -t $SESSION1:3 -n zeus
tmux new-window -t $SESSION1:4 -n bash
tmux select-window -t $SESSION1:3
tmux send-keys 'rm .zeus.sock' C-m
tmux send-keys 'zeus start' C-m
tmux select-window -t $SESSION1:1
sleep 20
tmux send-keys 'zeus c' C-m
tmux select-window -t $SESSION1:2
tmux send-keys 'zeus s' C-m

tmux -2 new-session -d -s $SESSION2
tmux new-window -t $SESSION2 -n 'skype'
tmux select-window -t $SESSION2:0
tmux send-keys 'sudo /Applications/Skype.app/Contents/MacOS/Skype' C-m
tmux send-keys '555' C-m
tmux attach-session -t $SESSION1
