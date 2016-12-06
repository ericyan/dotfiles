# Welcome to my $HOME

These are the configuration files to set up a workstation that I can comfortably
carrying out my work.

## Installation

First of all, make sure Git and Ruby are installed:

```
sudo apt-get install git ruby
```

After that, clone this repository to your local machine:

```
git clone git@github.com:ericyan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Then use `rake` to create symlinks for the configuartion files, for example:

```
rake fish # Individual component
rake all  # All in one
```
