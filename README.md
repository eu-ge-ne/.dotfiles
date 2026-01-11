# eu-ge-ne/.dotfiles

## Cloning

```bash
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/eu-ge-ne/.dotfiles.git $HOME/.dotfiles-tmp
rm $HOME/.dotfiles-tmp
```

## Brew

https://docs.brew.sh/Brew-Bundle-and-Brewfile

```bash
brew bundle dump --global --force --describe --brews --casks --taps
```
