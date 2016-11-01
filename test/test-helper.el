(require 'ert)
(when (require 'undercover nil t)
  (undercover "helm-go-package.el"))

(require 'helm-go-package)
