(defpackage #:logic-asd
  (:use :cl :asdf))

(defsystem logic
    :name "logic"
    :version "0.0.0"
    :maintainer "Frank Hemsing"
    :description "logic programming"
    :long-description "CL implementation of the logic programming system from The Reasoned Schemer"
    :depends-on ("stream")
    :components ((:file "variables")
		 (:file "unify")
		 (:file "substitutions"
			:depends-on ("variables"))
		 (:file "reification"
			:depends-on ("substitutions"))
    		 (:file "goal-constants")
		 (:file "all"
			:depends-on ("goal-constants"))
		 (:file "run"
			:depends-on ("reification"
				     "all"))
		 (:file "goals")
		 (:file "if")
		 (:file "cond"
			:depends-on ("if"
				     "all"
				     "goal-constants"))))
