(cl:defpackage :maxminddb.example
  (:use :cl)
  (:export #:load-and-init-libraries
           #:has-ip))
(cl:in-package :maxminddb.example)


(defun load-and-init-libraries (libmaxminddb-path adapter-path)
  (cffi:load-foreign-library libmaxminddb-path)
  (cffi:load-foreign-library adapter-path)
  (claw:initialize-adapter 'maxminddb:bodge-maxminddb))


(defun has-ip (database address)
  (cffi-c-ref:c-with ((db %maxminddb:s)
                      (lookup-result %maxminddb:lookup-result-s)
                      (error-code-0 :int)
                      (error-code-1 :int))
    (%maxminddb:open database %maxminddb:+mode-mmap+ (db &))
    (unwind-protect
         (progn
           (%maxminddb:lookup-string (lookup-result &) (db &) address
                                     (error-code-0 &) (error-code-1 &))
           (not (= (lookup-result :found-entry) 0)))
      (%maxminddb:close (db &)))))
