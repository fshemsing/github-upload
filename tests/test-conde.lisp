(require 'asdf)
(asdf:load-system :logic)
;;; examples from pages 11 -

;;; value is (olive oil):
(run* (x)
      (cond-e
       ((== x 'olive) #'succ)
       ((== x 'oil) #'succ)
       (#'succ #'fail)))

;;; value is (olive):
(run 1 (x)
      (cond-e
       ((== x 'olive) #'succ)
       ((== x 'olive) #'succ)))

;;; value is (olive |_.0| oil): 
(run* (x)
      (cond-e
       ((== 'virgin x) #'fail)
       ((== 'olive x) #'succ)
       (#'succ #'succ)
       ((== 'oil x) #'succ)
       (#'succ #'fail)))

;;;
()
