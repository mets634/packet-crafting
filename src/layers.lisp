(defpackage layers
  (:use :cl :bsl)
  (:export :ethernet :ipv4))
(in-package :layers)

(defmacro deflayer (name fields)
  `(defvar ,name (bsl:parse-binary-struct ,fields)))

(deflayer ethernet
  '((destination 48)
    (source 48)
    (type 16)))
    
(deflayer ipv4
  '((version 4)
    (ihl 4)
    (dscp 4)
    (ecn 2)
    (total-length 16)
    (identification 16)
    (flags 3)
    (fragment-offset 13)
    (time-to-live 8)
    (protocol 8)
    (header-checksum 16)
    (source-address 32)
    (destination-address 32)))
