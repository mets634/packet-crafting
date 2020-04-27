(defpackage packet-crafting/tests/main
  (:use :cl
        :packet-crafting
        :rove))
(in-package :packet-crafting/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :packet-crafting)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
