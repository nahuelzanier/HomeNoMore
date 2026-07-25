extends CanvasLayer

@onready var panel: Panel = $Panel
@onready var label: Label = $Panel/Label

func _ready() -> void:
	panel.visible = false

func show_text(text: String) -> void:
	if text == "":
		return
	label.text = text
	panel.visible = true

func hide_text() -> void:
	panel.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if panel.visible and event.is_action_pressed("action"):
		hide_text()
		get_viewport().set_input_as_handled()
