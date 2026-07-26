extends Node2D

@onready var candelero_pen_1: Node2D = $Elements/CandeleroPen1
@onready var candelero_pen_2: Node2D = $Elements/CandeleroPen2
@onready var candelero_pen_3: Node2D = $Elements/CandeleroPen3
@onready var candelero_pen_4: Node2D = $Elements/CandeleroPen4
@onready var candelero_pen_5: Node2D = $Elements/CandeleroPen5
@onready var puerta_locked: Node2D = $Elements/PuertaLocked
@onready var cajonera_1: Node2D = $Elements/Cajonera1
@onready var cajonera_2: Node2D = $Elements/Cajonera1

@onready var pentagram : Array[Node2D] = [
	candelero_pen_1,
	candelero_pen_2,
	candelero_pen_3,
	candelero_pen_4,
	candelero_pen_5]

func _on_candelero_pen_switch(number: Variant, state: Variant) -> void:
	pentagram[(number+1)%5].switch_it()
	pentagram[(number-1)%5].switch_it()

func _on_puerta_locked_check_lock() -> void:
	print(cajonera_1.opened)
	print(cajonera_2.opened)
	if cajonera_1.opened and cajonera_2.opened:
		puerta_locked.locked = false
		puerta_locked.open()
