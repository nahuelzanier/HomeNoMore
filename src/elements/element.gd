extends StaticBody2D
class_name Element

@export var collectible : bool = false
@export var element_name : String = ""
@export_multiline var examinar_text : String = ""
@export_multiline var juzgar_text : String = ""
@export_multiline var abrir_text : String = ""
@export_multiline var cerrar_text : String = ""
@export_multiline var golpear_text : String = ""
@export_multiline var mover_text : String = ""
@export_multiline var recolectar_text : String = ""
@onready var pop_direccion: PopupMenu = $CanvasLayer/PopDireccion
@onready var popup_menu: PopupMenu = $CanvasLayer/PopupMenu

var parent_element : Node2D
var at_players_back : bool = false

signal abrir_signal
signal cerrar_signal

func _ready():
	pop_direccion.add_item("Izquierda", 0)
	pop_direccion.add_item("Derecha", 1)
	popup_menu.add_item("Examinar " + element_name, 0)
	popup_menu.add_item("Juzgar", 1)
	popup_menu.add_separator()
	popup_menu.add_item("Activar", 2)
	popup_menu.add_item("Desactivar", 3)
	popup_menu.add_item("Golpear", 6)
	popup_menu.add_separator()
	popup_menu.add_item("Mover", 4)
	popup_menu.add_item("Recolectar", 5)

func activate_pop_up_menu():
	popup_menu.position = get_viewport().get_mouse_position()
	popup_menu.popup()
	if Interactions.carried_item:
		popup_menu.set_item_text(8, "Soltar " + Interactions.carried_item.element_name)
		popup_menu.set_item_id(8, 5)
	else:
		popup_menu.set_item_text(8, "Recolectar")
		popup_menu.set_item_id(8, 5)

func hide_menu():
	pass

func _on_popup_menu_id_pressed(id: int) -> void:
	call(Interactions.by_id[id])

func examinar(): DialogueUI.show_text(examinar_text)
func juzgar(): DialogueUI.show_text(juzgar_text)
func abrir():
	if get_parent().has_method("is_locked") and get_parent().is_locked():
		DialogueUI.show_text("Esta cerrado")
		emit_signal("abrir_signal")
	else:
		DialogueUI.show_text(abrir_text)
		emit_signal("abrir_signal")
func cerrar():
	DialogueUI.show_text(cerrar_text)
	emit_signal("cerrar_signal")

func golpear():
	DialogueUI.show_text(golpear_text)

func mover():
	pop_direccion.position = get_viewport().get_mouse_position()
	pop_direccion.popup()

func recolectar():
	if Interactions.carried_item:
		if get_parent().has_method("drop_effect"):
			get_parent().drop_effect()
		else:
			Interactions.carried_item.get_parent().global_position = get_global_mouse_position() - Vector2(0, 200)
			Interactions.carried_item = null
	elif collectible:
		DialogueUI.show_text(recolectar_text)
		Interactions.carried_item = self
		get_parent().global_position = Vector2(5000, 5000)
		get_parent().z_index = 1


func _on_pop_direccion_id_pressed(id: int) -> void:
	if id == 0:
		DialogueUI.show_text(mover_text)
		get_parent().global_position += Vector2(-200, 0)
	else:
		DialogueUI.show_text(mover_text)
		get_parent().global_position += Vector2(200, 0)
