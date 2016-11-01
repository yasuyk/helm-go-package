(add-to-list 'load-path default-directory)
(defvar helm-go-package-el "helm-go-package.el")
;; test byte-comple
(mapc #'byte-compile-file `(,helm-go-package-el))

;; test checkdoc
(with-current-buffer (find-file-noselect helm-go-package-el)
    (let ((checkdoc-diagnostic-buffer "*warn*"))
      (checkdoc-current-buffer t)))
