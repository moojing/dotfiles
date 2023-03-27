export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Users/mujingtsai/solana-release/bin:$PATH"
export PATH="/Users/mujingtsai/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

set PATH $PATH "$HOME/.bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mujingtsai/google-cloud-sdk/path.fish.inc' ]; . '/Users/mujingtsai/google-cloud-sdk/path.fish.inc'; end

# solana cli
export PATH="/Users/mujingtsai/.local/share/solana/install/active_release/bin:$PATH"
export PATH="$PATH:/Users/mujingtsai/.foundry/bin"

oh-my-posh --init --shell fish --config (brew --prefix oh-my-posh)"/themes/json.omp.json" | source
