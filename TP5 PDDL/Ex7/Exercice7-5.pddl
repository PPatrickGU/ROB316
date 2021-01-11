(define (problem TOUR-HANOI)
(:domain HANOI)
(:objects p1 p2 p3 d1 d2 d3 d4 d5)
(:init

	(peg p1) (peg p2)	(peg p3)
	(disk d1) (disk d2) (disk d3) (disk d4) (disk d5)
	(smaller d1 p1) (smaller d2 p1) (smaller d3 p1) (smaller d4 p1) (smaller d5 p1)	
	(smaller d1 p2)	(smaller d2 p2) (smaller d3 p2) (smaller d4 p2) (smaller d5 p2)
	(smaller d1 p3)	(smaller d2 p3) (smaller d3 p3) (smaller d4 p3) (smaller d5 p3)
	(smaller d1 d2)	(smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
	(smaller d2 d3)	(smaller d2 d4) (smaller d2 d5) 
	(smaller d3 d4)	(smaller d3 d5)
	(smaller d4 d5)	
	
	(on d1 d2) (on d2 d3)(on d3 d4) (on d4 d5) (on d5 p1)
	(clear d1)	(clear p2) (clear p3)

	(PinceEmpty)
)
(:goal 	(and (on d1 d2) (on d2 d3) (on d3 d4) (on d4 d5) (on d5 p3))
)
)