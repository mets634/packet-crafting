;;;; Defines network packets

(defpackage packet
  (:use :cl :layers)
  (:export :TODO))
(in-package :packet)

;;; A packet is just an array of layers,
;;; where each layer encapsulates the
;;; next one. For example, #(A B C) is
;;; the packet where A encapsulates B,
;;; and B encapsulates C.

(defconstant +default-packet-size+ 5)

(deftype packet (&optional (size +default-packet-size))
  "Defines a packet as an adjustible vector."
  
  `(make-array ,size :fill-pointer 0 :adjustable t))

(declaim (ftype (function (packet T) add-layer)))
(defun add-layer (packet  new-layer)
  (vector-push-extend new-layer packet))

(declaim (ftype (function (packet T) get-layer)))
(defun get-layer (packet index)
  (elf packet index))

(Declaim (ftype (packet) show))
(defun show (packet &optional (stream t))
  (loop for layer in packet do
    (format stream "~a~%" layer)))
