;;;; goal-constants: constant goals representing successful and
;;;;   unsuccessful evaluations of statements in a logic program
;;;;   a goal is represented as a function taking a substitution
;;;;   and returning a stream of substitutions

;;; succ (#s): a goal representing a successful statement in a logic
;;;   program
(defun succ (s) (unit s))

;;; fail (#u): a goal represneting an unsuccessful statement in a logic
;;;   program
(defun fail (s)
  (declare (ignorable s))
  (mzero))
