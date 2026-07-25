extends StaticBody2D
class_name Element

@export var element_name : String = ""
@export_multiline var examinar_text : String = ""
@export_multiline var juzgar_text : String = ""
@onready var pop_direccion: PopupMenu = $CanvasLayer/PopDireccion
@onready var popup_menu: PopupMenu = $CanvasLayer/PopupMenu

func _ready():
	pop_direccion.add_item("Izquierda", 0)
	pop_direccion.add_item("Derecha", 1)
	popup_menu.add_item("Examinar " + element_name, 0)
	popup_menu.add_item("Juzgar", 1)
	popup_menu.add_item("Mover", 2)

func activate_pop_up_menu():
	popup_menu.position = get_global_mouse_position()
	popup_menu.popup()

func hide_menu():
	pass

func _on_popup_menu_id_pressed(id: int) -> void:
	call(Interactions.by_id[id])

func examinar(): DialogueUI.show_text(examinar_text)
func juzgar(): DialogueUI.show_text(juzgar_text)
func mover():
	pop_direccion.position = get_global_mouse_position()
	pop_direccion.popup()
func abrir(): print("opens")
func cerrar(): print("closes")


func _on_pop_direccion_id_pressed(id: int) -> void:
	if id == 0:
		print("izq")
	else:
		print("der")
