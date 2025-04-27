extends Node2D



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "dashes"):
		$AnimationPlayer.play("dashes")



func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "dash_tutorial")
		Signals.emit_signal("changeScene", $".", "res://scenes/basic_attack_tutorial.tscn")



func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "dash_tutorial")
		Signals.emit_signal("changeScene", $".", "res://scenes/first_Boss.tscn")

func _on_ready() -> void:
	if(get_parent().get_meta("prevScene") != "basic_attack_tutorial"):
		$Player.position = Vector2(220, 5)
