extends Node

var startingScene = preload("res://scenes/StartingScene.tscn")

func _ready() -> void:
	pass
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$AnimationPlayer2.play("fadeOut")
	


func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(startingScene)
