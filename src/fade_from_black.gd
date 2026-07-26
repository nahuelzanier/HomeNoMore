extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.color.a = 1.0
	fade_from_black()

func fade_from_black(duration := 3.0):
	var tween = create_tween()
	tween.tween_property(
		color_rect,
		"color:a",
		0.0,
		duration
	)
