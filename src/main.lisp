(defpackage packet-crafting
  (:use :cl :layers)
  (:export main))
(in-package :packet-crafting)

(defun main (argv)
  (describe 'ethernet)
  (describe 'ipv4))
