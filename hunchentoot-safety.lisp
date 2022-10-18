;;;; Keep Hunchentoot server safe(never let anyone learn about server's information from response data)

(in-package :hunchentoot)

;; Hide server information - session's name
(defmethod session-cookie-name ((acceptor t))
  "session")

;; Hide server information in error pages.
(defun address-string ()
  "")

;; Hide server infromation in HTTP response header "server"
(defmethod acceptor-server-name 
    ((acceptor hunchentoot:acceptor))
  " ")

;; Disable add session id to urls
(setf hunchentoot:*rewrite-for-session-urls* nil)
