extends Area2D

@export var camera : Camera2D
@onready var camera_marker: Marker2D = $CameraMarker

func _on_area_entered(area: Area2D) -> void:
	var tween = create_tween()
	tween.tween_property(
		camera,
		"global_position",
		camera_marker.global_position,
		1.0
	)
