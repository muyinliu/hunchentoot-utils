(defsystem "hunchentoot-utils"
  :name "hunchentoot-utils"
  :version "0.0.1"
  :description "Hunchentoot utilities"
  :author "Muyinliu Xing <muyinliu@gmail.com>"
  :license "ISC"
  :depends-on ("hunchentoot")
  :serial t
  :components ((:static-file "hunchentoot-utils.asd")
               (:file "hunchentoot-safety")
               (:file "hunchentoot-utils")))
