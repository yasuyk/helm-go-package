;;; helm-go-package-test.el --- helm-go-package: unit test suite

;; Copyright (C) 2016 Yasuyuki Oka

;; Author: Yasuyuki Oka <yasuyk@gmail.com>
;; URL: https://github.com/yasuyk/helm-go-package

;; This file is not part of GNU Emacs.

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

;; Unit test suite of helm-go-package

;;; Code:


(eval-when-compile (require 'cl))

(require 'ert)

(defun should-equal? (a b)
  (should (equal a b)))

(ert-deftest test/helm-go-package--url-encode-url ()
  (let ((helm-pattern "cdn js"))
  (should-equal? (helm-go-package--godoc-url-with-query)
                 "https://godoc.org/?q=cdn%20js")))


(provide 'helm-go-package-test)

;; Local Variables:
;; coding: utf-8
;; End:

;;; helm-go-package-test.el ends here
