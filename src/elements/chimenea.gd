extends Node2D

func drop_effect():
	Interactions.carried_item.queue_free()
	DialogueUI.show_text("Ardan en el infierno! Jajajajaja")
