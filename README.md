# Welcome to my $HOME

These are the configuration files to set up a workstation that I can comfortably
carrying out my work. Everything is organised in topical packages and managed
using [GNU Stow](https://www.gnu.org/software/stow/).

## Installation

First of all, make sure Git and GNU Stow is installed:

```
sudo apt-get install git stow
```

After that, clone this repository to your local machine:

```
git clone git@github.com:ericyan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Then use `stow` to create symlinks for the configuartion files, for example:

```
stow -t $HOME fish
```
