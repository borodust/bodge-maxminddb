(uiop:define-package :maxminddb
  (:use :cl)
  (:export #:bodge-maxminddb))

(uiop:define-package :%maxminddb
  (:use))

(claw:defwrapper (maxminddb::bodge-maxminddb
                  (:headers "maxminddb.h")
                  (:includes :maxminddb-includes)
                  (:include-definitions "MMDB_.*"))
    :in-package :%maxminddb
    :trim-enum-prefix t
    :recognize-bitfields t
    :recognize-strings t
    :with-adapter (:dynamic "lib/adapter.c")
    :symbolicate-names (:in-pipeline
                        (:by-removing-prefixes "MMDB_")))
