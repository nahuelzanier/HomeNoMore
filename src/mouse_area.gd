extends Area2D

var current_body : Array[Node2D] = []

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action") and not current_body.is_empty():
		current_body[-1].activate_pop_up_menu()

func _on_body_entered(body: Node2D) -> void:
	current_body.append(body)

func _on_body_exited(body: Node2D) -> void:
	current_body.erase(body)
