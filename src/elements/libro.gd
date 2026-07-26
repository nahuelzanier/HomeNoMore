extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_element_abrir_signal() -> void:
	animated_sprite_2d.play("open")


func _on_element_cerrar_signal() -> void:
	animated_sprite_2d.play("closed")
