function tm4
    tmux new-session -d -s mysession \; split-window -h \; split-window -v \; select-pane -t 0 \; split-window -v \; attach-session -d -t mysession
end
