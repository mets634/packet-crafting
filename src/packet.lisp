;;;; Defines network packets

(defpackage packet
  (:use :cl :layers)
  (:export make-packet add-layer get-layer remove-layer show))
(in-package :packet)

;;; A packet is just an array of layers,
;;; where each layer encapsulates the
;;; next one. For example, #(A B C) is
;;; the packet where A encapsulates B,
;;; and B encapsulates C.

(defconstant +default-packet-size+ 5)

(defun make-packet (&optional (size +default-packet-size+))
  (make-array size :fill-pointer 0 :adjustable t))

(defun add-layer (packet &rest new-layers)
  "Adds new layers to a given packet, and extends the vector if needed."

  (loop for layer in new-layers do
    (vector-push-extend layer packet)))

(defun get-layer (packet index)
  "Returns a setf-able layer from a given packet."
  
  (elt packet index))

(defun remove-layer (packet index)
  "Removes the layer of a given packet at a given index."

  (setf packet (remove (get-layer packet index) packet)))

(defun show (packet &optional (stream t))
  "Prints a packet's layers in order of appearance."
  
  (loop for layer across packet do
    (format t "~a~%" layer)))

(defun serialize (packet &optional (stream t))
  (loop for layer across packet do
    (
