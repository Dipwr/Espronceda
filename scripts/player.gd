extends CharacterBody2D

@export var SpeedBase = 300.0
@export var SpeedMul = 2.0
@export var AnimMul = 2.0
@export var AnimatedSprite : AnimatedSprite2D

@export var disableSword :bool = false


var prevDirection = "Down"
var speed = 300.0

var canAttack: bool = true
var canCombo: bool = false
var canSpin: bool = false

var hasComboed: bool = false
var hasSpun: bool = false

func _physics_process(delta: float) -> void:
	if(disableSword):
		$Pluma.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		$Pluma.process_mode = Node.PROCESS_MODE_INHERIT
		
	if Input.is_action_pressed("gameAttack") and canAttack:
		if canCombo:
			$AnimationPlayer.play("attack2")
			$attackCooldown.start()
			$spinTimer.start()
			canAttack = false
			canSpin = true
			hasComboed = true
		elif canSpin:
			$AnimationPlayer.play("attack3")
			$spinCooldown.start()
			canAttack = false
			hasSpun = true
		else:
			$AnimationPlayer.play("attack1")
			$attackCooldown.start()
			$comboTimer.start()
			canAttack = false
			canCombo = true
			hasComboed = false
			hasSpun = false
	
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
	
func _on_attack_cooldown_timeout() -> void:
	canAttack = true

func _on_spin_cooldown_timeout() -> void:
	canAttack = true

func _on_combo_timer_timeout() -> void:
	canCombo = false
	if !hasComboed:
		$Pluma.visible = false

func _on_spin_timer_timeout() -> void:
	canSpin = false
	if !hasSpun:
		$Pluma.visible = false
	
