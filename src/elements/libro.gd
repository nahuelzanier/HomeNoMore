extends Node2D

var open_book : bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export_multiline var book_text : String = ""

func is_open_book():
	return open_book

func _on_element_abrir_signal() -> void:
	open_book = true
	animated_sprite_2d.play("open")

func _on_element_cerrar_signal() -> void:
	open_book = false
	animated_sprite_2d.play("closed")
