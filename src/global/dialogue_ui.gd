extends CanvasLayer

@onready var panel: Panel = $Panel
@onready var label: Label = $Panel/Label
@onready var timer: Timer = $Timer

@onready var sound_knock: AudioStreamPlayer = $SoundKnock
@onready var sound_juzgar: AudioStreamPlayer = $SoundJuzgar
@onready var rata_squeak_susto: AudioStreamPlayer = $RataSqueakSusto
@onready var rata_squeak_triste: AudioStreamPlayer = $RataSqueakTriste
@onready var silla_knock: AudioStreamPlayer = $SillaKnock
@onready var silla_move: AudioStreamPlayer = $SillaMove

@onready var calavera_knock: AudioStreamPlayer = $CalaveraKnock
@onready var calavera_move: AudioStreamPlayer = $CalaveraMove
@onready var espejo_roto: AudioStreamPlayer = $EspejoRoto
@onready var cajonera_knock: AudioStreamPlayer = $CajoneraKnock


func _ready() -> void:
	panel.visible = false

func show_text(text: String) -> void:
	if text == "":
		return
	label.text = text
	panel.visible = true
	timer.start()

func hide_text() -> void:
	panel.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if panel.visible and event.is_action_pressed("action"):
		hide_text()
		get_viewport().set_input_as_handled()

func _on_timer_timeout() -> void:
	hide_text()
