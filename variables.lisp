;;;; variables: functions for handling variables in a logic program

;;; logic-var: a variable corresponding to the symbol variable-name.
(defstruct
    (logic-var (:constructor logic-var (name))
	       (:predicate var?)
	       (:print-function (lambda (v stream depth)
				  (declare (ignore depth))
				  (format stream
					  "#<~A>"
					  (logic-var-name v)))))
  name)

;; eqvar: test equality of variables
(defun eqvar (var1 var2)
  (eq (logic-var-name var1)
      (logic-var-name var2)))
