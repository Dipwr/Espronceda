extends Node2D

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "release"):
		get_parent().set_meta("prevScene", "first_boss_finish_animation")
		Signals.emit_signal("changeScene", $".", "res://scenes/first_boss_dead.tscn")
