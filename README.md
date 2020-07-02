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
    - [Some Features](#some-features)
        - [Autocomplete, iedit, magit, etc.](#autocomplete-iedit-magit-etc)
        - [Magit](#magit)
        - [Neotree](#neotree)
        - [ECB (Emacs Code Browser)](#ecb-emacs-code-browser)
        - [Tabbar](#tabbar)
        - [Company](#company)
        - [Powerline with Flycheck](#powerline-with-flycheck)
            - [Flycheck with no errors.](#flycheck-with-no-errors)
            - [Flycheck with warnings.](#flycheck-with-warnings)
            - [Flycheck with errors.](#flycheck-with-errors)
    - [Install | Upgrade](#install--upgrade)
    - [Shortcuts](#shortcuts)

<!-- markdown-toc end -->

Inspired by the great Juan Pedro Fisanotti and his wonderful [fisa-vim-config](https://github.com/fisadev/fisa-vim-config), I share my [Emacs](https://www.gnu.org/software/emacs/) config.
This is my personal Emacs configuration, built according to my personal preferences, without any justification to think it's the best possible emacs configuration. If you like it, great! :) It's mainly oriented to PHP software development, but many of its features are useful for other languages and editing tasks.

This Emacs config have some useful modules:

* adoc-mode
* auto-complete
* dumb-jump
* emacs code browser (ecb)
* flycheck
* geben
* iedit
* js2-mode
* magit
* magit-gitflow
* markdown-mode
* markdown-toc
* neo-tree
* password-store
* php-mode
* powerline
* smarty-mode
* sqlformat
* yasnippet
* ...

## Some Features

### Autocomplete, iedit, magit, etc.

![emacs](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/emacs.gif "emacs")

### Magit
![magit-status](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/magit-status.png "magit-status")

### Neotree
![neotree](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/neotree.png "neotree")


### ECB (Emacs Code Browser)
![ecb](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/ecb.png "ecb")

### Tabbar
![tabbar](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/tabbar.png "tabbar")


### Company
![company](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/company.png "company")


### Powerline with Flycheck

[Flycheck](http://www.flycheck.org/) is activated and notifies in the powerline if there is a warning or an error

#### Flycheck with no errors.
![powerline-flycheck-ok](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-ok.png "powerline-flycheck-ok")

#### Flycheck with warnings.
![powerline-flycheck-warning](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-warning.png "powerline-flycheck-warning")

#### Flycheck with errors.
![powerline-flycheck-error](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-error.png "powerline-flycheck-error")



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
$ sudo apt-get install emacs exuberant-ctags git ripgrep silversearcher-ag pylint pep8 php-pear python-pip

$ sudo pear channel-update pear.php.net

$ sudo pear install PHP_CodeSniffer

$ sudo pip install sqlparse
```

2. Clone the repository:

```bash
$ git clone https://github.com/Abuelodelanada/pepe-emacs-config ~/.emacs.d
```

3. Open emacs and it will continue the installation by itself installing packages from melpa and elpa. Wait for it to finish... and done! You now have your new shiny powerful emacs :)


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
* `C-M-left`: tabbar-backward
* `M-up` : beginning-of-buffer
* `M-down`: end-of-buffer
* `C-M-right`: tabbar-forward
* `S-M-down` : enlarge window
* `S-M-left`: enlarge window horizontally
* `S-M-right`: shrink window horizontally
* `S-M-up`: shrink window
* `S-down`: windmove down
* `S-left`: 'windmove left
* `S-right`: windmove right
* `S-up`: windmove up
