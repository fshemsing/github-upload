;;;; if: elementary conditionals for logic programs

;;; if-e
(defmacro if-e (g0 g1 g2)
  (let ((s (gensym)))
    `(lambda (,s)
       (mplus (funcall (all ,g0 ,g1) ,s)
	      (lambda ()
		(funcall ,g2 ,s))))))

;;; if-i
(defmacro if-i (g0 g1 g2)
  (let ((s (gensym)))
    `(lambda (,s)
       (mplus-i (funcall (all ,g0 ,g1) ,s)
		(lambda ()
		  (funcall ,g2 ,s))))))

;;; if-a
(defmacro if-a (g0 g1 g2)
  (let ((s-inf (gensym))
	(s (gensym)))
    `(lambda (,s)
       (let ((,s-inf (funcall ,g0 ,s)))
	 (case-inf ,s-inf
		   (funcall ,g2 ,s)
		   ((,s) (funcall ,g2 ,s))
		   ((,s f) (bind ,s-inf ,g1)))))))

;;; if-u
(defmacro if-u (g0 g1 g2)
  (let ((s-inf (gensym))
	(s (gensym)))
    `(lambda (,s)
       (let ((,s-inf (funcall ,g0 ,s)))
	 (case-inf ,s-inf
		   (funcall ,g2 ,s)
		   ((,s) (funcall ,g1 ,s))
		   ((,s f) (funcall ,g1 ,s)))))))
