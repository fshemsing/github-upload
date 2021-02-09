(require 'asdf)
(asdf:load-system :logic)
;;; examples from pages 9 - 10 of The Reasoned Schemer

;;; value is nil: t and nil cannot unify
(run* (q)
      (== t q)
      (== nil q))

;;; value is (nil): 
(run* (q)
      (== nil q)
      (== nil q))

;;; value is (T):
(run* (q)
      (let ((x q))
	(== x t)))

;;; value is (|_.0|):
(run* (r)
      (fresh (x)
	     (== x r)))

;;; value is (T): == relation is transitive
(run* (q)
      (fresh (x)
	     (== t x)
	     (== x q)))

;;; value is (T): the order of these does not change the result
;;;   (in general the order might change the result)
(run* (q)
      (fresh (x)
	     (== x q)
	     (== t x)))
