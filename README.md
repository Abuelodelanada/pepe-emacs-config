# pepe-emacs-config

Inspired by the great Juan Pedro Fisanotti and his wonderful [fisa-vim-config](https://github.com/fisadev/fisa-vim-config), I share my EMACS config.
This is my personal Emacs configuration, built according to my personal preferences, without any justification to think it's the best possible emacs configuration. If you like it, great! :) It's mainly oriented to PHP software development, but many of its features are useful for other languages and editing tasks.

This emacs config have some useful modules:

* flycheck
* iedit
* geben
* php-mode
* markdown-mode
* smarty-mode
* js2-mode
* adoc-mode
* auto-complete
* dumb-jump
* powerline
* yasnippet
* ...

![pepe-emacs-config](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/emacs.gif "pepe-emacs-config")

## Install | Upgrade

0. This config is tested in Emacs 25.2.2, but may also work in previous versions.
    Your ~/.emacs.d folder should be empty. If you have one, rename it or move to a different location (to keep a backup, just in case you want to go back).
    Also rename or move your ~/.emacs file (to keep a backup, just in case you want to go back).

```shell
$ cd ~
$ mv .emacs.d .emacs.d.bak
$ mv .emacs .emacs.bak
```

1. Install the required dependencies:
```shell
$ sudo apt-get install emacs exuberant-ctags git silversearcher-ag pylint pep8 php-pear

$ sudo pear channel-update pear.php.net

$ sudo pear install PHP_CodeSniffer
```

2. Clone the repository.

```
$ git clone https://github.com/Abuelodelanada/pepe-emacs-config ~/.emacs.d
```

3. Open emacs and it will continue the installation by itself installing packages from melpa and elpa. Wait for it to finish... and done! You now have your new shiny powerful emacs :)


## Shortcuts

* "%":  go to match paren
* "F8": toggle neotree
* "F12": toggle menu bar mode
* "C-;": activate iedit-dwim
* "C-c down": flycheck-next-error
* "C-c up": flycheck-previous-error
* "C-c C-k": copy line
* "C-c C-w": copy word
* "C-c C-z":  term stop subjob
* "C-c c":  comment region
* "C-c u": uncomment region
* "C-d":  duplicate current line
* "C-l": go to line
* "C-t": create ctags
* "C-x p": run phpcbf --standard=PSR2 to the current buffer
* "M-down" : enlarge window
* "M-left": enlarge window horizontally
* "M-right": shrink window horizontally
* "M-up": shrink window
* "S-down": windmove down
* "S-left": 'windmove left
* "S-right": windmove right
* "S-up": windmove up


## Powerline screenshots

Flycheck is activated and notifies in the powerline if there is a warning or an error

![powerline-flycheck-ok](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-ok.png "powerline-flycheck-ok")

![powerline-flycheck-warning](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-warning.png "powerline-flycheck-warning")

![powerline-flycheck-error](https://github.com/Abuelodelanada/pepe-emacs-config/raw/master/images/powerline-flycheck-error.png "powerline-flycheck-error")
