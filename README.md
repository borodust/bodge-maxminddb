# libmaxminddb wrapper for Common Lisp

Wrapper over [`libmaxminddb`](https://github.com/maxmind/libmaxminddb) library.

# Installing

Make this library availble to `quicklisp`, e.g. by clone this wrapper into `~/quicklisp/local-projects/`.

```lisp
;; build adapter
(claw:build-adapter 'maxminddb:bodge-maxminddb "/path/to/adapter.so")
```

# Example
```lisp
;; add cl-bodge distribution into quicklisp
(ql-dist:install-dist "http://bodge.borodust.org/dist/org.borodust.bodge.txt")

;; load example
(ql:quickload :bodge-maxminddb/example)

;; load and init shared libraries
(maxminddb.example:load-and-init-libraries "/path/to/libmaxminddb.so" "/path/to/adapter.so"")

;; search for some IPs

(maxminddb.example:has-ip "/path/to/GeoLite2-Country.mmdb" "127.0.0.1")
(maxminddb.example:has-ip "/path/to/GeoLite2-Country.mmdb" "64.233.165.100")
```
