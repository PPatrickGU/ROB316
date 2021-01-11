(define (problem TOUR-HANOI)
(:domain HANOI)
(:objects p1 p2 p3 d1)
(:init
	(peg p1) (peg p2) (peg p3)
	(disk d1)
	(smaller d1 p1) (smaller d1 p2)	(smaller d1 p3)
	(on d1 p1) 
	(clear d1) (not(clear  p1)) (clear p2) (clear p3) 
	(PinceEmpty)
)
(:goal (and (on d1 p3) (clear p1))
)
)