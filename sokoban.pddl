(define (domain sokoban)
    (:requirements :strips)
    (:predicates
        (inc ?x ?y)
        (dec ?x ?y)
        (box ?x ?y)
        (at ?x ?y)
        (wall ?x ?y)
    )
    (:action moveLeft
        :parameters (?x ?y ?yMinus1)
        :precondition (and (at ?x ?y) (not(box ?x ?yminus1)) (dec ?y ?yMinus1) (not (wall ?x ?yMinus1)))
        :effect (and (not (at ?x ?y)) (at ?x ?yminus1))
    )
    (:action moveRight
        :parameters (?x ?y ?yPlus1)
        :precondition (and (at ?x ?y) (not(box ?x ?yPlus1)) (inc ?y ?yPlus1) (not (wall ?x ?yPlus1)))
        :effect (and (not (at ?x ?y)) (at ?x ?yPlus1))
    )
    (:action moveUp
        :parameters (?x ?y ?xMinus1)
        :precondition (and (at ?x ?y) (not(box ?xMinus1 ?y)) (dec ?x ?xMinus1) (not (wall ?xMinus1 ?y)))
        :effect (and (not (at ?x ?y)) (at ?xMinus1 ?y))
    )
    (:action moveDown
        :parameters (?x ?y ?xPlus1)
        :precondition (and (at ?x ?y) (not(box ?xPlus1 ?y)) (inc ?x ?xPlus1) (not (wall ?xPlus1 ?y)))
        :effect (and (not (at ?x ?y)) (at ?xPlus1 ?y))
    )
    (:action pushBoxToLeft
        :parameters (?x ?y ?yBoxMinus1 ?yBox)
        :precondition (and (at ?x ?y) (box ?x ?yBox) (dec ?y ?yBox) (dec ?yBox ?yBoxMinus1) (not (wall ?x ?yBoxMinus1)))
        :effect (and (not (at ?x ?y)) (at ?x ?yBox) (not (box ?x ?yBox)) (box ?x ?yBoxMinus1))
    )
    (:action pushBoxToRight
        :parameters (?x ?y ?yBoxPlus1 ?yBox)
        :precondition (and (at ?x ?y) (box ?x ?yBox) (inc ?y ?yBox) (inc ?yBox ?yBoxPlus1) (not (wall ?x ?yBoxPlus1)))
        :effect (and (not (at ?x ?y)) (at ?x ?yBox) (not (box ?x ?yBox)) (box ?x ?yBoxPlus1))
    )
    (:action pushBoxUp
        :parameters (?x ?y ?xBoxMinus1 ?xBox)
        :precondition (and (at ?x ?y) (box ?xBox ?y) (dec ?x ?xBox) (dec ?xBox ?xBoxMinus1) (not (wall ?xBoxMinus1 ?y)))
        :effect (and (not (at ?x ?y)) (at ?xBox ?y) (not (box ?xBox ?y)) (box ?xBoxMinus1 ?y))
    )
    (:action pushBoxDown
        :parameters (?x ?y ?xBoxPlus1 ?xBox)
        :precondition (and (at ?x ?y) (box ?xBox ?y) (inc ?x ?xBox) (inc ?xBox ?xBoxPlus1) (not (wall ?xBoxPlus1 ?y)))
        :effect (and (not (at ?x ?y)) (at ?xBox ?y) (not (box ?xBox ?y)) (box ?xBoxPlus1 ?y))
    )
)