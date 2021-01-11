;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Graph acyclique
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain NOEUDS)
  (:requirements :strips)
  (:predicates (on ?x)
			(arc ?x ?y)
			)
  (:action go
	     :parameters (?x ?y)
	     :precondition (and (on ?x) (arc ?x ?y))
	     :effect
	     (and (not(on ?x)) (on ?y))))
