;;;; run

;;; run: find the bindings of a given variable that occur in the firsn n successes of a
;;;   goal.
(defmacro run (n^ (x) &rest g)
  (let ((n (gensym))
	(s (gensym)))
    `(let ((,n ,n^) ; number of successful assigments to look for
	   (,x (logic-var (quote ,x)))) ; variable to return successful bindings of
       (if (or (not ,n) (> ,n 0))
           ;; map over the first n substitutions in the stream of substitutions
	   ;; representing all of run's goals succeeding reifying the value of x
	   (map-inf ,n
		    (lambda (,s)
		      (reify (walk* ,x ,s))) ; reify the value of x in the substitution
		    (funcall (all ,@g) empty-s)))))) ; all goals must be successful

;;; run*:
(defmacro run* ((x) &rest g)
  `(run nil (,x) ,@g))
