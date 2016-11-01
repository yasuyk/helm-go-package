## helm-go-package

[![licence][gplv3-badge]][gplv3-link]
[![melpa badge][melpa-badge]][melpa-link]
[![melpa stable badge][melpa-stable-badge]][melpa-stable-link]
[![travis build status](https://travis-ci.org/yasuyk/helm-go-package.svg?branch=master)](https://travis-ci.org/yasuyk/helm-go-package)


helm sources for [Go programming language](http://golang.org/)'s package.

## Requirements

- Emacs >= 24.3
- [helm][helm]
- [go-mode][go-mode]

## Installation

### Manual

Just drop `helm-go-package.el`. somewhere in your `load-path`.

```lisp
(add-to-list 'load-path "~/somewhere")
```

### MELPA

you can install `helm-go-package.el` from the [MELPA](http://melpa.milkbox.net/) repository.

## Usage

### `helm-go-package`

Helm for Go programming language's package.

#### Go local packages

These actions are available.

* Add a new import
* Add a new import as
* Show documentation
* Display [GoDoc][godoc]
* Visit package's directory

This persistent action is available.

* Show documentation

#### search Go packages on Godoc

These actions are available.

* Download and install
* Display [GoDoc][godoc]

## Customize

### `helm-go-package-godoc-browse-url-function`

Function to display package documentation on [GoDoc][godoc]. It is `browse-url` by default.

### `helm-source-go-package-godoc-description`

Face used for Godoc description.

## Sample configuration

Add the following to your emacs init file:

    (autoload 'helm-go-package "helm-go-package") ;; Not necessary if using ELPA package
    (eval-after-load 'go-mode
      '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

[godoc]:http://godoc.org/
[helm]:https://github.com/emacs-helm/helm
[go-mode]:https://github.com/dominikh/go-mode.el
[travis-badge]: https://travis-ci.org/yasuyk/helm-go-package.svg
[travis-link]: https://travis-ci.org/yasuyk/helm-go-package
[melpa-link]: http://melpa.org/#/helm-go-package
[melpa-stable-link]: http://stable.melpa.org/#/helm-go-package
[melpa-badge]: http://melpa.org/packages/helm-go-package-badge.svg
[melpa-stable-badge]: http://stable.melpa.org/packages/helm-go-package-badge.svg
[gplv3-badge]:http://img.shields.io/badge/license-GPLv3-blue.svg
[gplv3-link]:https://www.gnu.org/copyleft/gpl.html
