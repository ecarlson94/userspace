# Sensible defaults
set -g @plugin 'tmux-plugins/tmux-sensible'

# Seamless vim/tmux navigation
set -g @plugin 'christoomey/vim-tmux-navigator'

# Session saves through restart
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @resurrect-capture-pane-contents 'on'

set -g @plugin 'tmux-plugins/tmux-continuum'
# set -g @continuum-restore 'on'

# Prefix highlight
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @prefix_highlight_show_copy_mode "on"

# Nord color scheme
set -g @plugin "arcticicestudio/nord-tmux"
set -g @nord_tmux_show_status_content "0"

# status line battery
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-cpu'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
# `Prefix + I` to load plugins
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"
run '~/.tmux/plugins/tpm/tpm'

