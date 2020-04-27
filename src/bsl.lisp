(defpackage bsl
  (:use :cl)
  (:export :field-name :field-length))
(in-package :bsl)

;;; BSL: Binary Struct Language
;;; Format: A list of fields where each
;;;         field consists of (<NAME> <LENGTH_IN_BITS>)

(defun field-name (field)
  "Returns the name of a given field."
  (first field))

(defun field-length (field)
  "Returns the length of a given field in bits."
  (second field))

