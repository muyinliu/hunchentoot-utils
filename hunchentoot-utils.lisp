;;;; Utilities for hunchentoot

(in-package :hunchentoot)

(defun parameters (&key (post-p t) (get-p nil))
  "Get parameters from GET/POST request data."
  (let ((req *request*))
    (append (and post-p (post-parameters req))
            (and get-p (get-parameters req)))))

(defun remove-dispatcher (dispatcher)
  (when (member dispatcher *dispatch-table*)
    (setf *dispatch-table*
          (remove dispatcher *dispatch-table*))))

(defun unbound-easy-handler (function-symbol)
  "Unbound easy-handler defined with hunchentoot:define-easy-handler."
  (assert (symbolp function-symbol))
  (setf *easy-handler-alist*
        (delete-if #'(lambda (list)
                       (eq function-symbol (third list)))
                   *easy-handler-alist*))
  (fmakunbound function-symbol))

(defun enable-debug (&optional (second 10))
  "Enable Hunchentoot debug mode for N seconds."
  (unwind-protect
       (progn
         (setf *catch-errors-p* nil)
         (sleep second))
    (setf *catch-errors-p* t)))

(defun destroy-all-hunchentoot-worker-thread ()
  (mapcar #'bt:destroy-thread
          (remove-if-not #'(lambda (thread)
                             (search "hunchentoot-worker" (bt:thread-name thread)))
                         (bt:all-threads))))

(export '(parameters
          remove-dispatcher
          unbound-easy-handler
          enable-debug
          destroy-all-hunchentoot-worker-thread)
        '#:hunchentoot)
