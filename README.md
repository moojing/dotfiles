# dotfiles
dotfiles management repo ( use GNU stow ).


## How to make a softlink 
- add `.dotfiles` folder in `~/`.
- mv `~/.config/fish` `~/.dotfiles/fish/.config/fish`
- `cd ~/.dotfiles` 
- `stow fish`
