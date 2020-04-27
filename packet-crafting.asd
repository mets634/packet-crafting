(defsystem "packet-crafting"
  :version "0.1.0"
  :author "Andrey Hunter <mets634@gmail.com>"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "bsl")
		 (:file "headers")
		 (:file "main"))))
  :description "A library to craft network packets."
  :in-order-to ((test-op (test-op "packet-crafting/tests"))))

(defsystem "packet-crafting/tests"
  :author "Andrey Hunter <mets634@gmail.com>"
  :license ""
  :depends-on ("packet-crafting"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for packet-crafting."
  :perform (test-op (op c) (symbol-call :rove :run c)))
