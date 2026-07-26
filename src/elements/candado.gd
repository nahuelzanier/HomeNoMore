extends Node2D

var abierto : bool = false
@export var lock_opener : String = "Llavecita"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

signal se_abrio

func is_locked():
	if Interactions.carried_item:
		return Interactions.carried_item.element_name != lock_opener
	else:
		return true

func _on_element_abrir_signal() -> void:
	if not is_locked():
		abierto = true
		Interactions.carried_item.queue_free()
		emit_signal("se_abrio")
		animated_sprite_2d.play("abierto")

func _on_element_cerrar_signal() -> void:
	pass
