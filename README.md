# dotfiles
dotfiles management repo ( use GNU stow ).


## How to make a softlink 
- add `.dotfiles` folder in `~/`.
- mv `~/.config/fish` `~/.dotfiles/`
- `cd ~/.dotfiles` 
- `stow -t ~/.config/fish fish `
