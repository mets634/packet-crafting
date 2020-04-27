;;;; Creates a BSL parser

(defpackage bsl
  (:use :cl)
  (:export asdf))
(in-package :bsl)

;;; BSL: Binary Struct Language
;;; Format: A list of fields where each
;;;         field consists of (<NAME> <SIZE_IN_BITS> <DEFAULT_VALUE>).
;;;
;;;         NAME - A symbol representing the field name.
;;;         SIZE_IN_BITS - The number of bits this field should take up. The sum total of all
;;;                        the sizes must align to a byte (a multiple of 8).
;;;         DEFAULT_VALUE - The default value of this field. If NIL, default value will not be allowed.

(defun name (field)
  (first field))

(defun size (field)
  (second field))

(defun value (field)
  (third field))

(defun field (bsl field-name)
  (assoc field-name bsl))

(defun get-lsb (x n)
  "Returns x shifted n bits to the right and the n lsb bits."

  (logand x (1- (expt 2 n))))

(defun set-lsb (x n new-lsb)
  "Pushes new-lsb as the new LSB of x, while shifting x n bits to the left."

  (+ (ash x n) (get-lsb new-lsb n)))

(defun take-needed-bits (field n)
  "Takes up to n bits from the given field (as much as it can).
   Returns the resulting value taken from field and the number of bits."

  (when (< (size field) n)
    (setf n (size field)))
  (values (get-lsb (value field) n) n))
  

(defun create-byte-generator (bsl)
  "Creates a closure that generates individual bytes of data taken from BSL."

  (let ((new-byte 0) (bits-count 0))

    (defun generate-next-byte ()
      "Generates bytes taken from the given BSL."

      (loop while (< bits-count 8)
	    do (update-new-byte)))

    (defun update-new-byte ()
      "Updates new-byte's value to include the current-field's bits as well."

      (let ((current-field (first bsl)))
	(multiple-value-bind (new-lsb n) (take-needed-bits current-field (- 8 bits-count))
	  (progn
	    (setf new-byte (set-lsb new-byte n new-lsb))
	    (incf bits-count n)
	    (decf (second current-field) n) ; TODO: Change this from second
	    (when (zerop (size current-field))
	      (setf bsl (rest bsl)))
	    new-byte))))))

	  
(defun serialize-bsl (bsl)
  "Serializes a BSL expression to binary data.")  
