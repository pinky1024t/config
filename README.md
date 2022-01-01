# .config

My Config Files (Dotfiles) using XDG Base Directory.

## Installation

First, define XDG Base Directory in `/etc/profile`.

```/etc/profile
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state
```

Clone this repo.  
If `.config` directory is alredy exist, move your `.config`.

```bash
cd
mv .config .config_backup
git clone https://github.com/pinky1024t/config.git .config
```

Move your `.bashrc` or `.zshrc` from `$HOME` to backup directory.  
And make symlink.

```bash
mkdir dotfiles_backup
mv .config/bash/.bash* dotfiles_backup
mv .config/bash/.zsh* dotfiles_backup
ln -s .config/bash/.bash* -t $HOME/
ln -s .config/zsh/.zshenv -t $HOME/
```

## Add sub directory under .config to manage with Git

The default setting is to ignore all sub directories under `.config`.

If you want to add an application that you want to manage with git, modify `.gitignore`.  

For example:

```.gitignore
!/foo/
```