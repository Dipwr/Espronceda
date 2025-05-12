extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body == $Player):
		Signals.emit_signal("changeScene", $".", "res://scenes/dash_tutorial.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "basic_attack_tutorial")
		Signals.emit_signal("changeScene", $".", "res://scenes/first_boss_start_animation.tscn")

func _on_ready() -> void:
	if(get_parent().get_meta("prevScene") != "dash_tutorial"):
		$Player.position = Vector2(220, 5)
