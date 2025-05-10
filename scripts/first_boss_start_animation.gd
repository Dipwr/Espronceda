extends Node2D



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "start"):
		get_parent().set_meta("prevScene", "first_boss_start_animation")
		Signals.emit_signal("changeScene", $".", "res://scenes/first_boss.tscn")
