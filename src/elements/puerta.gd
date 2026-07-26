extends Node2D

@onready var sound_abre: AudioStreamPlayer = $SoundAbre
@onready var sound_cierre: AudioStreamPlayer = $SoundCierre

@export var locked : bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_reverse: AnimatedSprite2D = $AnimatedSprite2DRev
@onready var element: Element = $Element

signal check_lock

func is_locked():
	return locked

func open():
	animated_sprite_2d.play("abierta")
	animated_sprite_2d_reverse.play("abierta")
	sound_abre.play()
	element.set_collision_layer_value(1, false)

func close():
	animated_sprite_2d.play("cerrada")
	animated_sprite_2d_reverse.play("cerrada")
	sound_cierre.play()
	element.set_collision_layer_value(1, true)

func _on_element_abrir_signal() -> void:
	emit_signal("check_lock")
	print(locked)
	if not locked:
		open()

func _on_element_cerrar_signal() -> void:
	close()
