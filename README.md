# The Pepe Emacs config

 <table style="width:100%; border:0px; align:center">
  <tr>
    <td><img src="https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/emacs.png" alt="Emacs"></td>
    <td><img src="https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/magit.png" alt="Magit!"></td>
    <td><img src="https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/flycheck.png" alt="Flycheck"></td>
  </tr>
</table> 


Inspired by the great Juan Pedro Fisanotti and his wonderful [fisa-vim-config](https://github.com/fisadev/fisa-vim-config), I share my [Emacs](https://www.gnu.org/software/emacs/) config.
This is my personal Emacs configuration, built according to my personal preferences, without any justification to think it's the best possible emacs configuration. If you like it, great! :) It's mainly oriented to PHP software development, but many of its features are useful for other languages and editing tasks.

This Emacs config have some useful modules:

* adoc-mode
* auto-complete
* dumb-jump
* flycheck
* geben
* iedit
* js2-mode
* magit
* magit-gitflow
* markdown-mode
* neo-tree
* php-mode
* powerline
* smarty-mode
* sqlformat
* yasnippet
* ...

![pepe-emacs-config](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/emacs.gif "pepe-emacs-config")

## Install | Upgrade

0. This config is tested in Emacs 25.2.2, but may also work in previous versions.
    Your ~/.emacs.d folder should be empty. If you have one, rename it or move to a different location (to keep a backup, just in case you want to go back).
    Also rename or move your ~/.emacs file (to keep a backup, just in case you want to go back).

```bash
$ cd ~
$ mv .emacs.d .emacs.d.bak
$ mv .emacs .emacs.bak
```

1. Install the required dependencies:
```bash
$ sudo apt-get install emacs exuberant-ctags git silversearcher-ag pylint pep8 php-pear python-pip

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

* "%":  go to match paren
* "F8": toggle neotree
* "F12": toggle menu bar mode
* "C-;": activate iedit-dwim
* "C-c C-k": copy line
* "C-c C-w": copy word
* "C-c C-z":  term stop subjob
* "C-c TAB": format sql
* "C-c c":  comment region
* "C-c down": flycheck-next-error
* "C-c u": uncomment region
* "C-c up": flycheck-previous-error
* "C-d":  duplicate current line
* "C-l": go to line
* "C-t": create ctags
* "C-x g": magit-status
* "C-x p": run phpcbf --standard=PSR2 to the current buffer
* "M-left" tabbar-backward
* "M-right" tabbar-forward
* "S-M-down" : enlarge window
* "S-M-left": enlarge window horizontally
* "S-M-right": shrink window horizontally
* "S-M-up": shrink window
* "S-down": windmove down
* "S-left": 'windmove left
* "S-right": windmove right
* "S-up": windmove up


## Powerline screenshots

[Flycheck](http://www.flycheck.org/) is activated and notifies in the powerline if there is a warning or an error

![powerline-flycheck-ok](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-ok.png "powerline-flycheck-ok")

![powerline-flycheck-warning](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-warning.png "powerline-flycheck-warning")

![powerline-flycheck-error](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-error.png "powerline-flycheck-error")
