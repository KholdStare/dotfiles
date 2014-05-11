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

## Vim

A list of shortcuts that I don't want to forget. Anything marked with
**custom** is either added or changed from default.

* `[I` - lists all occurances of keyword in current and included files.

*Commands:*

* `/<pattern>` - search
   * `\v` - "very magic" patterns accept regular expressions
* `:s` - substitute
   * `\%V` - restrict substitution to visual selection (as opposed to whole lines)

### Surround

* `ds<delim>` - Delete surrounding delimeters.
* `cs<delim-from><delim-to>` - Change surrounding delimeters.
* *visual selection* `S<delim>` - Surround selection with delimiters.

*Delimiters:*
* Open brackets `{[(` - surround with padding
* Closed brackets `)]}` - surround without padding
* `<` - XML/HTML tag. Prompts for attributes
* Any punctuation mark
* `a` - Angle brackets (since `<` is used for HTML)

### NerdTree - File Browser

* `<F6>` - toggle NerdTree **custom**
* `:NERDTreeFind` - Find current file in filesystem. (Type `:N<Tab>F<Tab><CR>`)

### NerdCommenter - Comments

* `<Leader>c<space>` - toggle comments on line(s).
* `<Leader>cA` - Append comment to end of line.
* `<Leader>c$` - Comments the current line from the cursor to the end of line.
 
### Tabular.vim - Text Alignment

See vimcast for demo: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

* `:Tabularize /=` - align on equals sign

### Fugitive - Git integration

* `Gstatus` - git status. Subcommands:
   * `o` - open file
   * `D` - diff file
   * `-` - stage/unstage file
   * `C` - start commit
* `Gcommit`
* `Gwrite` - stage current file
* `Gread` - revert file to last checkin
* `Gblame` - annotate lines with users/commit shas
* `Gedit` - flip between working and committed versions of file.
* `Gedit <sha>` - look at commit/tree/blob in history
* `Git <command>` - do a regular git command

See fugitive vimcasts:
* [A complement to command line git](http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/)
* [Working with the git index](http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/)
* [Resolving merge conflicts with vimdiff](http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/)
* [Browsing the git object database](http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/)
* [Exploring the history of a git repository](http://vimcasts.org/episodes/fugitive-vim-exploring-the-history-of-a-git-repository/)
