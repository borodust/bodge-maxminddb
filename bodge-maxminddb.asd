(asdf:defsystem :bodge-maxminddb
  :description "Wrapper over libmaxminddb"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:uiop :claw)
  :serial t
  :components ((:file "claw")
               (:module :maxminddb-includes :pathname "lib/maxminddb/include/")
               (:module :spec)))


(asdf:defsystem :bodge-maxminddb/example
  :description "Example for bodge-maxminddb system"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:uiop :claw :cffi-c-ref :bodge-maxminddb)
  :serial t
  :components ((:file "example")))
