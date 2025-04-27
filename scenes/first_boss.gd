extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "first_boss")
		Signals.emit_signal("changeScene", $".", "res://scenes/dash_tutorial.tscn")
