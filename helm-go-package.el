;;; helm-go-package.el --- helm source for Go programming language's package

;; Copyright (C) 2013 Yasuyuki Oka

;; Author: Yasuyuki Oka <yasuyk@gmail.com>
;; Version: DEV
;; URL: https://github.com/yasuyk/helm-go-package
;; Package-Requires: ((helm "1.0") (go-mode "9"))
;; Keywords: helm go

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Add the following to your Emacs init file:
;;
;; (require 'helm-go-package)  ;; Not necessary if using ELPA package
;; (substitute-key-definition 'go-import-add 'helm-go-package go-mode-map)

;; That's all.

;;; Code:

(require 'helm)
(require 'go-mode)

(defgroup helm-go-package nil
  "Go package related Applications and libraries for Helm."
  :prefix "helm-go-package-"
  :group 'http)

(defcustom helm-go-package-godoc-browse-url-function 'browse-url
  "Function to display package documentation on godoc.org.
It is `browse-url' by default."
  :group 'helm-go-package
  :type 'symbol)

(defun helm-go-package--package-paths ()
  (list
   (format "%s/src/pkg"
           (car (split-string (shell-command-to-string "go env GOROOT") "\n")))
   (format "%s/src"
           (car (split-string (shell-command-to-string "go env GOPATH") "\n")))))

(defun helm-go-package--locate-directory (name path)
  "Locate all occurrences of the sub-directory NAME in PATH.
Return a list of absolute directory names in reverse order, or nil if
not found."
  (let (found)
    (condition-case err
        (dolist (elt path)
          (setq elt (eval elt))
          (cond
           ((stringp elt)
            (and (file-accessible-directory-p
                  (setq elt (expand-file-name name elt)))
                 (push elt found)))
           (elt
            (setq found (go-ffap-directory
                         name (if (atom elt) (list elt) elt))))))
      (error
       (message "In helm-go-package--locate-directory: %s"
                (error-message-string err))))
    found))

(defconst helm-go-package-godoc-format
  "http://godoc.org/%s"
  "Format of godoc.org for browse URL.")

(defun helm-go-package--godoc-browse-url (candidate)
  (funcall helm-go-package-godoc-browse-url-function
           (format helm-go-package-godoc-format candidate)))

(defun helm-go-package--visit-package-directory (candidate)
  (find-file (car (helm-go-package--locate-directory
                   candidate (helm-go-package--package-paths)))))

(defun helm-go-package--persistent-action (candidate)
  (call-interactively 'other-window)
  (godoc candidate))

(defvar helm-source-go-package
  '((name . "Go packages")
    (candidates . go-packages)
    (persistent-action . helm-go-package--persistent-action)
    (persistent-help . "Show documentation")
    (action . (("Add a new import" . (lambda (candidate)
                                       (go-import-add nil candidate)))
               ("Add a new import as" . (lambda (candidate)
                                          (go-import-add t candidate)))
               ("Show documentation" . godoc)
               ("Display GoDoc" . helm-go-package--godoc-browse-url)
               ("Visit package's directory" .
                helm-go-package--visit-package-directory))))
  "Helm source for Go programming language' package.")

;;;###autoload
(defun helm-go-package ()
  "Helm for Go programming language's package.

These actions are available.
* Add a new import
* Add a new import as
* Show documentation
* Display GoDoc
* Visit package's directory

This persistent action is available.
* Show documentation"
  (interactive)
  (helm-other-buffer 'helm-source-go-package
                     "*helm go package*"))

(provide 'helm-go-package)

;; Local Variables:
;; coding: utf-8
;; End:

;;; helm-go-package.el ends here
