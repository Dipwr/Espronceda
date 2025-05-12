extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "poema_first")
		Signals.emit_signal("changeScene", $".", "res://scenes/first_boss_dead.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "poema_first")
		Signals.emit_signal("changeScene", $".", "res://scenes/poema_second.tscn")

func _on_ready() -> void:
	if(get_parent().get_meta("prevScene") != "first_boss_dead"):
		$Player.position = Vector2(0, -115)
