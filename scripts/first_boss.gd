extends Node2D

var isInMiddle: bool = false
var isInInner: bool = true
var isInSafeZone: bool = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body == $Player):
		get_parent().set_meta("prevScene", "first_boss")
		Signals.emit_signal("changeScene", $".", "res://scenes/shoot_tutorial.tscn")

func _on_dash_timeout() -> void:
	if (isInSafeZone):
		if(randi_range(0,2) > 0):
			$Enemy/dashDirection.look_at($Player.position)
			$Enemy/dashDirection.rotate(PI)
			$Enemy/dashDirection.rotate(randf_range(-PI/4, PI/4))
		else:
			$Enemy/dashDirection.rotate(randf_range(0, 2*PI))
	else: 
		if (isInInner):
			$Enemy/dashDirection.rotate(randf_range(0, 2*PI))
		elif (isInMiddle && !isInInner):
			if(randi_range(0, 1)):
				$Enemy/dashDirection.look_at(Vector2(0,0))
			else:
				$Enemy/dashDirection.look_at(Vector2(0,0))
				$Enemy/dashDirection.rotate(randf_range(PI/3, PI+(2*PI)/3))
		else:
			$Enemy/dashDirection.look_at(Vector2(0,0))
			$Enemy/dashDirection.rotate(randf_range(-PI/4, PI/4))
		
	$Enemy.velocity = Vector2(400, 0).rotated($Enemy/dashDirection.rotation)
	$Enemy.move_and_slide()
	$DashDuration.start()
	

func _physics_process(delta: float) -> void:
	$Enemy.move_and_slide()


func _on_dash_duration_timeout() -> void:
	$Enemy.velocity = Vector2(0 ,0)


func _on_inner_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body == $Enemy):
		isInInner = true	
		isInMiddle = false

func _on_inner_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body == $Enemy):
		isInInner = false
		isInMiddle = true

func _on_middle_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body == $Enemy):
		isInMiddle = true
		isInInner = false


func _on_middle_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body == $Enemy):
		isInInner = false
		isInMiddle = false


func _on_safe_zone_body_entered(body: Node2D) -> void:
	if (body == $Player):
		isInSafeZone = true

func _on_safe_zone_body_exited(body: Node2D) -> void:
	if (body == $Player):
		isInSafeZone = false
