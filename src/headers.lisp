(defpackage headers
  (:use :cl)
  (:export :*ethernet-header* :*ipv4-header))
(in-package :headers)

(defvar *ethernet-header*
  '((destination 48)
    (source 48)
    (type 16)))
    
(defvar *ipv4-header*
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
