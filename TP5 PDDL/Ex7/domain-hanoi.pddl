;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Tour de hanoi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain HANOI)
  (:requirements :strips)
  (:predicates (peg ?x)
			(disk ?x)
			(smaller ?x ?y)
			(on ?x ?y)
			(clear ?x)
			(PinceEmpty)
			(onPince ?x)
			(PinceFull)
			)
  (:action remove_from_peg
	     :parameters (?x ?y)
	     :precondition (and (disk ?x) (peg ?y) (on ?x ?y) (clear ?x) (PinceEmpty) )
	     :effect
	     (and (not(PinceEmpty)) (onPince ?x) (PinceFull) (clear ?y) (not(on ?x ?y)) ))
  (:action put_on_peg
	     :parameters (?x ?y)
	     :precondition (and (disk ?x) (peg ?y) (onPince ?x) (clear ?x) (clear ?y) (smaller ?x ?y) )
	     :effect
	     (and (PinceEmpty) (not(onPince ?x)) (not(PinceFull)) (on ?x ?y) (not(clear ?y))))
  (:action remove_from_disk
	     :parameters (?x ?y)
	     :precondition (and (disk ?x) (disk ?y) (on ?x ?y) (clear ?x) (PinceEmpty))
	     :effect
	     (and (not(PinceEmpty)) (onPince ?x)(PinceFull) (clear?y) (not(on ?x ?y))))
  (:action put_on_disk
	     :parameters (?x ?y)
	     :precondition (and (disk ?x) (disk ?y) (onPince ?x) (clear ?x)  (clear ?y) (smaller ?x ?y) )
	     :effect
	     (and (PinceEmpty) (not(onPince ?x)) (not(PinceFull)) (on ?x ?y) (not(clear ?y))))
)
