# My Dotfiles

## General Philosophy

I want my configuration to be:

- **Simple**: Everything should be organized, easy to understand, and easy to modify.
- **Minimal**: When possible, don't add extra tools that aren't regularly used. Installing an entire plugin manager for one plugin is probably overkill.
- **Portable**: This repository should be able to be used on any machine, so use tools that are cross-platform and, when not possible, make it easy to pick and choose which are used on which system.

## Structure

- `files`: Contains all the files that will be symlinked to the home directory.
- `scripts`: Contains the install scripts that can be used to automatically install the configuration.

### Shell structure

#### zsh

- `.zshenv` sets environment variables that should be available to all `zsh` invocations, including scripts and non-login, non-interactive shells.
- `.zshrc` loads individual configuration modules. It has variables to set the order in which modules are loaded.
- `.zsh/` is a directory that contains the individual configuration modules. All `*.zsh` files in this directory are loaded.

#### bash

> [!NOTE]
> I don't use `bash` as a login or interactive shell, but I keep a minimal `bash` configuration for compatibility.

- `.bashrc` sets very basic environment variables so tools using `bash` can access things like the `PAGER`, `EDITOR`, and `XDG_CONFIG_HOME`.
- `.bash_profile` simply sources `.bashrc`.
