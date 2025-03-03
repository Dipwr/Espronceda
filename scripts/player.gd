extends CharacterBody2D

@export var SpeedBase = 300.0
@export var SpeedMul = 2.0
@export var AnimMul = 2.0
@export var AnimatedSprite : AnimatedSprite2D


var prevDirection = "Down"
var speed = 300.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("gameSprint"):
		speed = SpeedBase * SpeedMul
		AnimatedSprite.speed_scale = AnimMul
	else:
		speed = SpeedBase
		AnimatedSprite.speed_scale = 1
	
	var xDirection := Input.get_axis("gameLeft", "gameRight")
	var yDirection := Input.get_axis("gameUp", "gameDown")
	
	velocity.x = xDirection * speed * delta * scale.x
	velocity.y = yDirection * speed * delta * scale.y
	
	if xDirection == 1:
		prevDirection = "Right"
	if xDirection == -1:
		prevDirection = "Left"
	if yDirection == 1:
		prevDirection = "Down"
	if yDirection == -1:
		prevDirection = "Up"
	
	if (xDirection == 0) and (yDirection == 0):
		AnimatedSprite.animation = "idle" + prevDirection
	else:
		AnimatedSprite.animation = "run" + prevDirection

	move_and_slide()
	
	
