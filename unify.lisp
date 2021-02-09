;;;; unify: unify expressions in a logic program

;;; unify: unify v and w, if the unification fails return #f if it succeeds
;;;   return a new substitution in which v is associated with w
(defun unify (v w subs)
  ;; unify can be optimized by testing if w and v are eq after walking v to
  ;; avoid walking w unneccessarily
  (let ((v (walk v subs))
	(w (walk w subs)))
    (cond
      ((eq v w) subs)
      ;; if v or w is a variable, associate v with w
      ((var? v) (ext-s v w subs))
      ((var? w) (ext-s w v subs))
      ;; if v and w are trees unify all of their subexpressions
      ;; (if one of v and w is a tree and the other isn't they cannot be unified)
      ((and (consp v) (consp w))
       (unify (cdr v)
	      (cdr w)
	      (unify (car v)
		     (car w)
		     subs)))
      ;; if v and w are not the same thing, and are not variables then
      ;; they unify only if they are equal
      ((equal v w) subs)
      (t nil))))
