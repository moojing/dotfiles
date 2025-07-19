set -gx PATH /opt/homebrew/bin $PATH
# export PATH="/usr/local/bin:$PATH"
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH /Users/mujingtsai/solana-release/bin $PATH
set -gx PATH /Users/mujingtsai/Library/Python/3.7/bin $PATH

# Add node to 
fnm env --shell=fish | source

set -gx PATH $HOME/.rbenv/shims $PATH


# The next line updates PATH for the Google Cloud SDK.
if test -f $HOME/google-cloud-sdk/path.fish.inc
    source $HOME/google-cloud-sdk/path.fish.inc
end

oh-my-posh --init --shell fish --config (brew --prefix oh-my-posh)/themes/json.omp.json | source

