extends Node2D



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$".".get_parent().set_meta("dashUnlocked", true)
	Signals.emit_signal("changeScene", $".", "res://scenes/love_first.tscn")
