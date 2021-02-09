(require 'asdf)
(asdf:load-system :logic)

;;;; from pages 6 - 7 of The Reasoned Schemer
;;;; value is (T) for all of these, they show that the order of the
;;;;  arguments to == is irrelevant
(run* (q)
      (fresh (x)
	     (== t x)
	     (== t q)))

(run* (q)
      (fresh (x)
	     (== x t)
	     (== t q)))

(run* (q)
      (fresh (x)
	     (== t x)
	     (== q t)))

(run* (q)
      (fresh (x)
	     (== x t)
	     (== x q)))

(run* (q)
      (fresh (x)
	     (== t x)
	     (== x q)))

(run* (q)
      (fresh (x)
	     (== x t)
	     (== q x)))

(run* (q)
      (fresh (x)
	     (== t x)
	     (== q x)))
