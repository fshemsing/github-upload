;;;; reification: functions for creating representations of variables

;;; reify-s: creates a representation for the value of an variable
;;;   returns a substitution in which the variable
;;;   is associated with its representation. If the variable is
;;;   associated with a tree, adds representations for all of the
;;;   free variables in the tree to the substitution.
(defun reify-s (expr subs)
  (let ((v (walk expr subs)))
    (cond ((var? v)
	   (ext-s v (reify-name (size-s subs)) subs))
	  ((consp v)
	   (reify-s (cdr v)
		    (reify-s (car v) subs)))
	  (t subs))))

;;; reify-name: returns a name representing a reified free variable
;;;   using the number n as a suffix (n should be equal to the number
;;;   of variables reified so far).
(defun reify-name (n)
  (intern
   (with-output-to-string (str)
     (format str "_.~A" n))))

;;; reify: reify an expression
(defun reify (v)
  (walk* v (reify-s v empty-s)))
