extends CharacterBody2D

@export var health: int = 100

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.get_meta("type") == "weapon"):
		health -= body.get_meta("damage")
		$AnimationPlayer.play("hit")
		if (health <= 0):
			$AnimatedSprite2D.animation = "die"
			$deathTimer.start()

func _on_timer_timeout() -> void:
	$".".process_mode = Node.PROCESS_MODE_DISABLED
