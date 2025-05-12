extends Node2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "first_boss_dead")
		Signals.emit_signal("changeScene", $".", "res://scenes/shoot_tutorial.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "first_boss_dead")
		if ($".".get_parent().get_meta("dashUnlocked")):
			$".".get_parent().set_meta("shootUnlocked", true)
			Signals.emit_signal("changeScene", $".", "res://scenes/poema_first.tscn")
		else:
			Signals.emit_signal("changeScene", $".", "res://scenes/love_start_animation.tscn")


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "first_boss_dead")
		if ($".".get_parent().get_meta("dashUnlocked")):
			Signals.emit_signal("changeScene", $".", "res://scenes/love_first.tscn")
		else:
			Signals.emit_signal("changeScene", $".", "res://scenes/love_start_animation.tscn")

func _on_ready() -> void:
	if(get_parent().get_meta("prevScene") != "first_boss_finish_animation"):
		if(get_parent().get_meta("prevScene") == "love_first"):
			$Player.position = Vector2(-53, -79)
		else:
			$Player.position = Vector2(59, -81)
