# README

I recently decided to try out [LazyVim](https://lazyvim.org/) and removed my custom Vim setup. It met many of my existing needs (and more) while allowing me to get rid of a lot of unnecessary complexity in my dotfiles. While I was it, I also decided to switch from iTerm2 to [Alacritty](https://github.com/alacritty/alacritty), which felt faster on my machine.

This repository tracks my current configurations and scripts that I use to set up a new machine. It is currently tied to macOS, primarily because I haven't gotten around to mirroring the setup for my Linux uses.

## Usage

```sh
git clone git@github.com:cjoudrey/dotfiles.git ~/dotfiles
cd dotfiles
./install
```

## Implementation

I use [Homebrew](https://brew.sh/) as my package manager and track desired packages in `Brewfile` which is kept up-to-date by running:

```sh
brew bundle dump --force --file ~/dotfiles/Brewfile
```

Configurations are stored in `configs/` and symlinks to these files get created when running `./install`.
