extends Node2D

@export var lock_opener : String = "Llavecita"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func is_locked():
	if Interactions.carried_item:
		return Interactions.carried_item.element_name != lock_opener
	else:
		return true

func _on_element_abrir_signal() -> void:
	if not is_locked():
		Interactions.carried_item.queue_free()
		animated_sprite_2d.play("abierto")

func _on_element_cerrar_signal() -> void:
	animated_sprite_2d.play("cerrado")
