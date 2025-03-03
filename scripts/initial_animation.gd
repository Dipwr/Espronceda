extends Node

var startingScene = preload("res://scenes/StartingScene.tscn")

func _ready() -> void:
	pass
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Signals.emit_signal("changeScene", $".", "res://scenes/StartingScene.tscn")
