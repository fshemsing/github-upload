(require 'asdf)
(asdf:load-system :logic)
;;;; exmples from pages 1 - 6 of The Reasoned Schemer

(defun add-==-tests ()
;;; value is nil: no value of q satisfies the goal fail
    (add-test '(:bucket "test-=="
		:id "test-==-1")
	      (lambda ()
		(run* (q)
		      #'fail))
	      nil)

;;; value is (T): the only value of q satisfying q = t is t
  (add-test '(:bucket "test-=="
	      :id "test-==-2")
	    (lambda ()
	      (run* (q)
		    (== t q)))
	    '(T))

;;; value is nil: no value of q satisfies fail and q = t
  (add-test '(:bucket "test-=="
	      :id "test-==-3") 
	    (lambda ()
	      (run* (q)
		    #'fail
		    (== t q)))
	    nil)

;;; value is (T)
  (add-test '(:bucket "test-=="
	      :id "test-==-4")
	    (lambda ()
	      (run* (q)
		    #'succ
		    (== t q)))
	    '(T))

;;; value is (corn)
  (add-test '(:bucket "test-=="
	      :id "test-==-4")
	    (lambda ()
	      (run* (r)
		    #'succ
		    (== 'corn r)))
	    '(corn))

;;; value is (nil)
  (add-test '(:bucket "test-=="
	      :id "test-==-5")
	    (lambda ()
	      (run* (r)
		    #'succ
		    (== nil r)))
	    '(nil))

;;; value is nil
  (add-test '(:bucket "test-=="
	      :id "test-==-6")
	    (lambda ()
	      (run* (x)
		    (let ((x nil))
		      (== x t))))
	    nil))
