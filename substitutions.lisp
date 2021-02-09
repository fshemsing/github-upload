;;;; substitutions: functions for keeping track of values associated with variables

;;;; associations: an associtation represents a mapping of a variable to a value in the
;;;;   logic program. This should not be confused with the variable's value in Scheme
;;;;   which is just #(<variable-name>).
;;;;
;;;;   A mapping of a set of variables to their corresponding values in the logic program
;;;;   is calles a substitution.
;;;;
;;;;   Associations are implemented as cons pairs, with the car being a variable and the
;;;;   cdr being the value it is associated with.
;;;;
;;;;   Substitutions are implemented as lists of cons pairs (commonly known as
;;;;   association lists)

;;; rhs: right hand side of an association
(defun rhs (a)
  (cdr a))

;;; lhs: left hand side of an association
(defun lhs (a)
  (car a))

;;; assq: assoc with eq as the test
(defun assq (elem alist)
  (assoc elem alist :test #'eq))

;;; empty-s: the empty substitution, containing no associations
(defparameter empty-s '())

;;; size-s: a number representing the size of a substitution
(defun size-s (subs)
  (length subs))

;;; walk: determine what value a variable is associated with for a given substitution.
;;;   If the variable is associated with a variable, walks the chain of associations
;;;   until a terminal assignment (non-variable value, or variable value with no
;;;   associations) is found.
(defun walk (expr subs)
  (cond ((var? expr)
	 (let ((a (assq expr subs)))
	   (cond
	     (a (walk (rhs a) subs))
	     (t expr))))
	(t expr)))

;;; walk*: determines what value a variable is associated with. If the variable is
;;;   associated with a tree, traverses the tree walking the chain of associations
;;;   for each variable in the tree until a terminal assignment is found for all
;;;   variables in the tree. Returns a tree containing the values of the terminal
;;;   assignments thus obtained.
(defun walk* (v subs)
  (let ((val (walk v subs)))
    (cond ((var? val) val)
	  ((consp val) (cons (walk* (car val) subs)
			     (walk* (cdr val) subs)))
	  (t val))))

;;; ext-s: extend a substitution by adding a new association
(defun ext-s (rh lh subs)
  (cons (cons rh lh) subs))

;;;; macros for test
(defun let1-var (x expr)
  `(let ((,x (logic-var (quote ,x))))
     ,expr))

(defun mk-var  (x)
  `(logic-var (quote ,x)))

(defun foldr (fn lst &optional init)
  (if init
      (reduce fn lst :from-end t :initial-value init)
      (reduce fn lst :from-end t)))

(defmacro with-vars (vars &rest body)
  (foldr #'let1-var vars `(progn ,@body)))

