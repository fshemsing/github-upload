;;;; cond: condidtionals for logic programs

;;; cond-aux: macro to generate conds based on different
;;;   types of ifs
(defmacro cond-aux (ifer (&optional g0 &rest g) &rest c)
  (cond
    ((and (null g0)
	  (null g))
     #'fail)
    ((eq g0 'else) `(all ,@g))
    ((null c) `(all ,g0 ,@g))
    (t `(,ifer ,g0
	       (all ,@g)
	       (cond-aux ,ifer ,@c)))))

;;; cond-e
(defmacro cond-e (&rest c)
  `(cond-aux if-e ,@c))

;;; cond-i
(defmacro cond-i (&rest c)
  `(cond-aux if-i ,@c))

;;; cond-a
(defmacro cond-a (&rest c)
  `(cond-aux if-a ,@c))

;;; cond-u
(defmacro cond-u (&rest c)
  `(cond-aux if-u ,@c))
