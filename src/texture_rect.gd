extends TextureRect

func _ready() -> void:
	show()
	get_tree().paused = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		await get_tree().create_timer(1.0).timeout
		get_tree().paused = false
		queue_free()
