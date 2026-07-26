extends Node2D

var opened : bool = false
@export var requires_back : bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var element: Element = $Element

func _on_element_abrir_signal() -> void:
	opened = true
	animated_sprite_2d.play("abierta")
	if requires_back and not element.at_players_back:
		print("LOCKIUNG")
		await get_tree().create_timer(3.0).timeout
		opened = false
		_on_element_cerrar_signal()

func _on_element_cerrar_signal() -> void:
	opened = false
	animated_sprite_2d.play("cerrada")
