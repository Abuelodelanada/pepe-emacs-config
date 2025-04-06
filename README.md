[![](http://img.shields.io/badge/license-MIT-green.svg)](https://github.com/Abuelodelanada/pepe-emacs-config/blob/master/LICENSE)

# The Pepe Emacs config

 <table style="width:100%; border:0px; align:center">
  <tr>
    <td><img src="https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/emacs.png" alt="Emacs"></td>
    <td><img src="https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/magit.png" alt="Magit!"></td>
    <td><img src="https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/flycheck.png" alt="Flycheck"></td>
  </tr>
</table>

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [The Pepe Emacs config](#the-pepe-emacs-config)
    - [Install | Upgrade](#install--upgrade)
    - [Some Features](#some-features)
        - [Autocomplete, iedit, magit, etc.](#autocomplete-iedit-magit-etc)
        - [Magit](#magit)
        - [Neotree](#neotree)
        - [ECB (Emacs Code Browser)](#ecb-emacs-code-browser)
        - [Centaur-tabs](#centaur-tabs)
        - [Company](#company)
        - [Highlight Indent Guides](#highlight-indent-guides)
        - [Powerline with Flycheck](#powerline-with-flycheck)
            - [Flycheck with no errors.](#flycheck-with-no-errors)
            - [Flycheck with warnings.](#flycheck-with-warnings)
            - [Flycheck with errors.](#flycheck-with-errors)
    - [Shortcuts](#shortcuts)

<!-- markdown-toc end -->


Inspired by the great Juan Pedro Fisanotti and his wonderful [fisa-vim-config](https://github.com/fisadev/fisa-vim-config), I share my [Emacs](https://www.gnu.org/software/emacs/) config.
This is my personal Emacs configuration, built according to my personal preferences, without any justification to think it's the best possible emacs configuration. If you like it, great! :) It's mainly oriented to Python, PHP and Golang software development, but many of its features are useful for other languages and editing tasks.

This Emacs config have some useful modules:

* adoc-mode
* company
* emacs code browser (ecb)
* flycheck
* geben
* iedit
* js2-mode
* lsp-mode
* magit
* magit-gitflow
* markdown-mode
* markdown-toc
* neo-tree
* php-mode
* powerline
* projectile
* smarty-mode
* sqlformat
* yasnippet
* and much more...


## Install | Upgrade

0. This config is tested in Emacs 25.2.2, but may also work in previous versions.
    Your `~/.emacs.d` folder should be empty. If you have one, rename it or move to a different location (to keep a backup, just in case you want to go back).
    Also rename or move your `~/.emacs` file (to keep a backup, just in case you want to go back).

```bash
$ cd ~
$ mv .emacs.d .emacs.d.bak
$ mv .emacs .emacs.bak
```

1. Install the required dependencies:
```bash
$ sudo apt-get install emacs exuberant-ctags git ripgrep silversearcher-ag pylint pep8 php-pear python-pip virtualenv

$ sudo pear channel-update pear.php.net

$ sudo pear install PHP_CodeSniffer

$ pip install sqlparse

$ sudo snap install pyright --classic

$ go install golang.org/x/tools/gopls@latest  # Make sure gopls is in your PATH

$ sudo npm install -g @mermaid-js/mermaid-cli
```

2. Clone the repository:

```bash
$ git clone https://github.com/Abuelodelanada/pepe-emacs-config ~/.emacs.d
```

3. Open emacs and it will continue the installation by itself installing packages from melpa and elpa. Wait for it to finish... and done! You now have your new shiny powerful emacs :)


## Some Features

### Autocomplete, iedit, magit, etc.

![emacs](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/emacs.gif "emacs")

### Magit
![magit-status](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/magit-status.png "magit-status")

### Neotree
![neotree](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/neotree.png "neotree")


### ECB (Emacs Code Browser)
![ecb](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/ecb.png "ecb")

### Centaur-tabs
![centaur-tabs](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/centaur-tabs.png "centaur-tabs")


### Company
![company](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/company.png "company")


### Highlight Indent Guides
![highlight-indent-guides](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/highlight-indent-guides.png "highlight-indent-guides")



### Powerline with Flycheck

[Flycheck](http://www.flycheck.org/) is activated and notifies in the powerline if there is a warning or an error

#### Flycheck with no errors.
![powerline-flycheck-ok](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-ok.png "powerline-flycheck-ok")

#### Flycheck with warnings.
![powerline-flycheck-warning](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-warning.png "powerline-flycheck-warning")

#### Flycheck with errors.
![powerline-flycheck-error](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-error.png "powerline-flycheck-error")



## Shortcuts

* `%`:  go to match paren
* `F7`: toggle ecb (emacs code browser)
* `F8`: toggle neotree
* `F12`: toggle menu bar mode
* `C-;`: activate iedit-dwim
* `C-c C-k`: copy line
* `C-c C-w`: copy word
* `C-c C-z`:  term stop subjob
* `C-c TAB`: format sql
* `C-c c`:  comment region
* `C-c down`: flycheck-next-error
* `C-c u`: uncomment region
* `C-c up`: flycheck-previous-error
* `C-d`:  duplicate current line
* `C-l`: go to line
* `C-t`: create ctags
* `C-x g`: magit-status
* `C-x p`: run phpcbf --standard=PSR2 to the current buffer
* `C-<prior>`: centaur-tabs-backward
* `C-<next>`: centaur-tabs-forward's
* `C-up` : beginning-of-buffer
* `C-down`: end-of-buffer
* `C-M-g`: lsp-goto-type-definition (Go to definition)
* `C-M-p`: xref-go-back (Return from definition)
* `S-M-down` : enlarge window
* `S-M-left`: enlarge window horizontally
* `S-M-right`: shrink window horizontally
* `S-M-up`: shrink window
* `S-down`: windmove down
* `S-left`: windmove left
* `S-right`: windmove right
* `S-up`: windmove up
