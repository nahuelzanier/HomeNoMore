extends Node2D

@onready var fade_from_black: CanvasLayer = $FadeFromBlack

@onready var candelero_pen_1: Node2D = $Elements/CandeleroPen1
@onready var candelero_pen_2: Node2D = $Elements/CandeleroPen2
@onready var candelero_pen_3: Node2D = $Elements/CandeleroPen3
@onready var candelero_pen_4: Node2D = $Elements/CandeleroPen4
@onready var candelero_pen_5: Node2D = $Elements/CandeleroPen5
@onready var puerta_locked: Node2D = $Elements/PuertaLocked
@onready var cajonera_1: Node2D = $Elements/Cajonera1
@onready var cajonera_2: Node2D = $Elements/Cajonera1

@onready var candado_1: Node2D = $Elements/Candado1
@onready var candado_2: Node2D = $Elements/Candado2
@onready var candado_3: Node2D = $Elements/Candado3

@onready var pentagram : Array[Node2D] = [
	candelero_pen_1,
	candelero_pen_2,
	candelero_pen_3,
	candelero_pen_4,
	candelero_pen_5]



func _on_candelero_pen_switch(number: Variant, state: Variant) -> void:
	pentagram[(number+1)%5].switch_it()
	pentagram[(number-1)%5].switch_it()
	var completo = true
	for candela in pentagram:
		completo = completo and candela.prendida
	if completo:
		DialogueUI.show_text("Un escalosfrio te recorre el cuerpo...")

func _on_puerta_locked_check_lock() -> void:
	if cajonera_1.opened and cajonera_2.opened:
		puerta_locked.locked = false
		puerta_locked.open()

func _on_candado_se_abrio() -> void:
	print("ABIERTO")
	if candado_1.abierto and candado_2.abierto and candado_3.abierto:
		DialogueUI.show_text("Si tuviera una moneda por cada puerta que abri en mi vida, y que no lleva a lo que esperaba... tendria al menos 4. 
								Gracias por investigar!")
		get_tree().paused = true
		fade_from_black.fade_to_black()
