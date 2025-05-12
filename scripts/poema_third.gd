extends Node2D

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_parent().set_meta("prevScene", "poema_third")
	Signals.emit_signal("changeScene", $".", "res://scenes/poema_boss.tscn")

func _process(delta: float) -> void:
	if (Input.is_action_pressed("skip1") && Input.is_action_pressed("skip2") && Input.is_action_pressed("skip3")):
		get_parent().set_meta("prevScene", "poema_third")
		Signals.emit_signal("changeScene", $".", "res://scenes/poema_boss.tscn")
