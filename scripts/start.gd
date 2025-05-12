extends Control



func _on_button_button_down() -> void:
	Signals.emit_signal("changeScene", $".", "res://scenes/initial_animation.tscn")
