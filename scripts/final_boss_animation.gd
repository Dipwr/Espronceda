extends Node2D



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Signals.emit_signal("changeScene", $".", "res://scenes/final_boss.tscn")
