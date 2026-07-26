extends Node2D

@export var pentagram_id : int
@export var prendida : bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D

signal switch(number, state)

func _ready() -> void:
	if prendida:
		turn_on()
	else:
		turn_off()

func turn_on():
	prendida = true
	animated_sprite_2d.play("prendida")
	point_light_2d.show()

func turn_off():
	prendida = false
	animated_sprite_2d.play("apagada")
	point_light_2d.hide()

func switch_it():
	if prendida:
		turn_off()
	else:
		turn_on()

func _on_element_abrir_signal() -> void:
	if not prendida:
		emit_signal("switch", pentagram_id, true)
		turn_on()

func _on_element_cerrar_signal() -> void:
	if prendida:
		emit_signal("switch", pentagram_id, false)
		turn_off()
