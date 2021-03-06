(defsystem "packet-crafting"
  :version "0.1.0"
  :author "mets634 <mets634@gmail.com>"
  :license "MIT"
  :depends-on (:lisp-binary)
  :components ((:module "src"
                :components
                ((:file "bsl")
		 (:file "layers")
		 (:file "packet")
		 (:file "main"))))
  :description "A library to craft network packets."
  :in-order-to ((test-op (test-op "packet-crafting/tests"))))

(defsystem "packet-crafting/tests"
  :author "mets634 <mets634@gmail.com>"
  :license "MIT"
  :depends-on ("packet-crafting"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for packet-crafting."
  :perform (test-op (op c) (symbol-call :rove :run c)))
