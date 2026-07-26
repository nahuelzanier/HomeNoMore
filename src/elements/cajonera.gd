extends Node2D

var opened : bool = false
@export var requires_back : bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var element: Element = $Element
@onready var sound_abrir: AudioStreamPlayer = $SoundAbrir
@onready var sound_cerrar: AudioStreamPlayer = $SoundCerrar

func soy_cajonera(): pass

func _on_element_abrir_signal() -> void:
	opened = true
	animated_sprite_2d.play("abierta")
	sound_abrir.play()
	if requires_back and not element.at_players_back:
		print("LOCKIUNG")
		await get_tree().create_timer(3.0).timeout
		opened = false
		_on_element_cerrar_signal()

func _on_element_cerrar_signal() -> void:
	sound_cerrar.play()
	opened = false
	animated_sprite_2d.play("cerrada")
