;;;; Creates a BSL parser

(defpackage bsl
  (:use :cl :lisp-binary)
  (:export deflayer))
(in-package :bsl)

;;; BSL: Binary Struct Language
;;; Format: A list of fields where each
;;;         field consists of (<NAME> <SIZE_IN_BITS> <DEFAULT_VALUE>).
;;;
;;;         NAME - A symbol representing the field name.
;;;         SIZE_IN_BITS - The number of bits this field should take up. The fields should align to
;;;                        a byte. Meaning, there can be no field that starts in one byte and ends in a different one.
;;;         DEFAULT_VALUE - The default value of this field. If NIL, default value will not be allowed.

;;; BSL field extraction functions

(defun name (field)
  (first field))

(defun size (field)
  (second field))

(defun value (field)
  (third field))

(defun field (bsl field-name)
  (assoc field-name bsl))

;;; Network-layer creation using BSL

(defmacro deflayer (name &rest fields)
  "Creates a binary-structure (lisp-binary:defbinary)
  representing a network-layer with the specified fields."
  
  `(lisp-binary:defbinary ,name (:byte-order :big-endian) ; network-byte-order = big-endian
     ,@(mapcar
	#'(lambda (field) `(,(name field) ,(value field) :type ,(size field)))
	fields)))
