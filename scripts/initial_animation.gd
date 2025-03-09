extends Node

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Signals.emit_signal("changeScene", $".", "res://scenes/StartingScene.tscn")

func _process(delta: float) -> void:
	if (Input.is_action_pressed("skip1") && Input.is_action_pressed("skip2") && Input.is_action_pressed("skip3")):
		Signals.emit_signal("changeScene", $".", "res://scenes/StartingScene.tscn")
