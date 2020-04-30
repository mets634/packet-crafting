;;;; Defines network packets

(defpackage packet
  (:use :cl :layers)
  (:export make-packet add-layer get-layer show))
(in-package :packet)

;;; A packet is just an array of layers,
;;; where each layer encapsulates the
;;; next one. For example, #(A B C) is
;;; the packet where A encapsulates B,
;;; and B encapsulates C.

(defconstant +default-packet-size+ 5)

(defun make-packet (&optional (size +default-packet-size+))
  (make-array size :fill-pointer 0 :adjustable t))

(defun add-layer (packet  new-layer)
  (vector-push-extend new-layer packet))

(defun get-layer (packet index)
  (elt packet index))

(defun show (packet &optional (stream t))
  (loop for layer across packet do
    (format t "~a~%" layer)))
