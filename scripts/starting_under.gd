extends Node2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "starting_under")
		Signals.emit_signal("changeScene", $".", "res://scenes/basic_attack_tutorial.tscn")


func _on_ready() -> void:
	if(get_parent().get_meta("prevScene") != "falling_animation"):
		$Player.position = Vector2(464, -2)
		$Camera2D.position.x = 247
