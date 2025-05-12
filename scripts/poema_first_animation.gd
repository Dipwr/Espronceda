extends Node2D

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$".".get_parent().set_meta("shootUnlocked", true)
	Signals.emit_signal("changeScene", $".", "res://scenes/poema_first.tscn")
