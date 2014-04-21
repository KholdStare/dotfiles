## Configurations included

* vim
* vim plugins
* tmux
* git
* bash
* ghci
* cabal-install
* bin folder with useful tmux/git scripts

## Usage

Automate the process of cloning and symlinking scripts:

```bash
curl https://raw.githubusercontent.com/KholdStare/dotfiles/master/clone-and-install.bash | bash
```

If you have already cloned the repository, `link.bash` and `force.bash` are available.

* `link.bash` - creates symlinks to configuration files and scripts if those
  filenames don't already exist. Otherwise leaves things alone.
* `force.bash` - backs up existing files/links, and creates appropriate
  symlinks. If the correct links are already there, does nothing.
* Both scripts are idempotent
