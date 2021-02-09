(require 'asdf)
(asdf:load-system :logic)
;;; examples from pages 7 - 8 of The Reasoned Schemer

;;; value is (|_.0|): x is a free variable in any assignment satisfying only #'succ
(run* (x)
      #'succ)

;;; value is (|_.0|): the fresh x shadows the x assigned to nil by let
(run* (x)
      (let ((x nil))
	(fresh (x)
	       (== t x))))

;;; value is ((|_.0| |_.1|): different fresh variables are reified to
;;;   different symbols and the name of the free vairaible is irrelevant
(run* (r)
      (fresh* (x y)
	     (== (cons x (cons y nil))
		 r)))

(run* (s)
      (fresh* (x y)
	      (== (cons x (cons y nil))
		  s)))

;;; value is ((|_.0| |_.1| |_.0|)): fresh x shadows let x so x =/= y when
;;;   reified
(run* (r)
      (fresh (y)
	     (let ((x y))
	       (declare (ignorable x))
	       (fresh (x)
		      (== (cons y (cons x (cons y nil)))
			  r)))))

;;; value is ((|_.0| |_.0| |_.0|)): if "fresh (x)" is omitted in the previous
;;;  example, then x and y are the same variable, and are reified to the
;;;  same symbol
(run* (r)
      (fresh (y)
	     (let ((x y))
	       (declare (ignorable x))
	       (== (cons y (cons x (cons y nil)))
		   r))))

;;; value is ((|_.0| |_.1| |_.0|)): the order of the numbers in reified
;;;   variables depend on the order that reify traverses a list and not
;;;   the names of the variables
(run* (r)
      (fresh (y)
	     (let ((x y))
	       (declare (ignorable x))
	       (fresh (x)
		      (== (cons x (cons y (cons x nil)))
			  r)))))

