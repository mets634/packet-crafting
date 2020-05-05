;;;; Implements functionality related to PCAP files

(defpackage pcap
  (:use :cl :lisp-binary)
  (:export todo))
(in-package :pcap)

;;; The supported PCAP file format is version 2.4
;;; See: https://wiki.wireshark.org/Development/LibpcapFileFormat for more details.

(defbinary pcap-global-header ()  ; TODO: What if the pcap is in opposite endiannes from system endiannes?
  "PCAP files start with a global header for the whole file."
  
  (magic #xa1b2c3d4 :type (magic :actual-type (unsigned-byte 32)
				 :value #xa1b2c3d4))
  (version-major :type (unsigned-byte 16))  ; Currently, only version 2 is supported.
  (version-minor :type (unsigned-byte 16))  ; Currently, only version 4 is supported.
  (this-zone :type (signed-byte 32))
  (sigfigs :type (unsigned-byte 32))
  (snaplens :type (unsigned-byte 32))
  (network :type (unsigned-byte 32)))

(defbinary pcap-record-header ()
  "Every packet is preceded by a record-header."

  (timestamp-seconds :type (unsigned-byte 32))
  (timestamp-microseconds :type (unsigned-byte 32))
  (included-length :type (unsigned-byte 32))
  (original-length :type (unsigned-byte 32)))
