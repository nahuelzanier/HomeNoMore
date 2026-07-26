extends StaticBody2D

@onready var pop_direccion: PopupMenu = $CanvasLayer/PopDireccion
@onready var popup_menu: PopupMenu = $CanvasLayer/PopupMenu

var parent_element : Node2D

func _ready() -> void:
	popup_menu.add_item("Recolectar", 5)

func activate_pop_up_menu():
	if Interactions.carried_item:
		popup_menu.position = get_viewport().get_mouse_position()
		popup_menu.popup()
		if Interactions.carried_item:
			popup_menu.set_item_text(0, "Soltar " + Interactions.carried_item.element_name)
			popup_menu.set_item_id(0, 5)

func hide_menu():
	pass

func _on_popup_menu_id_pressed(id: int) -> void:
	call(Interactions.by_id[id])

func recolectar():
	if Interactions.carried_item:
		Interactions.carried_item.get_parent().global_position = get_global_mouse_position() + Vector2(0, 20)
		Interactions.carried_item = null
