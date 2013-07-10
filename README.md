## Synopsis

helm source for [Go programming language](http://golang.org/)'s package.

## Requirements

- [helm][helm]
- [go-mode][go-mode]

## Installation

### Manual

Just drop `helm-go-package.el`. somewhere in your `load-path`.

```lisp
(add-to-list 'load-path "~/somewhere")
(require 'helm-go-package)
```

### MELPA

If you're an Emacs 24 user or you have a recent version of package.el
you can install `helm-go-package.el` from the [MELPA](http://melpa.milkbox.net/) repository.

## Usage

### `helm-go-package`

Helm for Go programming language's package.

These actions are available.

* Add a new import
* Add a new import as
* Show documentation
* Display [GoDoc][godoc]
* Visit package's directory

This persistent action is available.

* Show documentation

## Customize

### `helm-go-package-godoc-browse-url-function`

Function to display package documentation on [GoDoc][godoc]. It is `browse-url` by default.

## Sample configuration

Add the following to your emacs init file:

    (autoload 'helm-go-package "helm-go-package") ;; Not necessary if using ELPA package
    (eval-after-load 'go-mode
      '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

[godoc]:http://godoc.org/
[helm]:https://github.com/emacs-helm/helm
[go-mode]:https://github.com/dominikh/go-mode.el
