;;;; goals: core functions for working with logic programs

;;; == : assert equivalence
(defun == (v w)
  (lambda (s)
    (let ((u (unify v w s)))
      (cond
	(u (succ u))
	(t (fail s))))))

;;; fresh: introduce a free variable
(defmacro fresh ((x) &rest g)
  (let ((s (gensym)))
    `(lambda (,s)
       (let ((,x (logic-var (quote ,x))))
	 (funcall (all ,@g) ,s)))))

;;; fresh*: introduce multiple free values
(defmacro fresh* ((&rest xs) &rest g)
  (let ((s (gensym)))
    `(lambda (,s)
       (let* ,(mapcar (lambda (x)
			`(,x (logic-var (quote ,x))))
		      xs)
	 (funcall (all ,@g) ,s)))))
