extends CharacterBody2D

@export var health: int = 100
@export var shoot: bool = false

var bulletPath = preload("res://scenes/bullet.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.get_meta("type") == "weapon"):
		health -= body.get_meta("damage")
		$AnimationPlayer.play("hit")
		if (health <= 0):
			health = 9999
			$AnimatedSprite2D.animation = "die"
			$deathTimer.start()

func _on_timer_timeout() -> void:
	$".".process_mode = Node.PROCESS_MODE_DISABLED

func _on_shoot_timer_timeout() -> void:
	if(shoot):
		if(get_parent().get_node("Player").position.x < 160):
			fire()

func fire() -> void:
	var bullet = bulletPath.instantiate()
	bullet.pos = $BulletOrigin.global_position
	get_parent().add_child(bullet)
