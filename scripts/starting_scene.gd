extends Node2D

var entered = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == $Player:
		entered = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == $Player:
		entered = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("gameAccept") && entered:
		Signals.emit_signal("changeScene", $".", "res://scenes/initial_door_animation.tscn")
