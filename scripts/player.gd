extends CharacterBody2D

@export var SpeedBase = 300.0
@export var SpeedMul = 2.0
@export var AnimMul = 2.0
@export var AnimatedSprite : AnimatedSprite2D

@export var disableSword :bool = false

var bulletPath = preload("res://scenes/player_bullet.tscn")


var prevDirection = "Down"
var prevDirectionX = 0
var prevDirectionY = 0
var speed = 300.0

var canAttack: bool = true
var canCombo: bool = false

var hasComboed: bool = false

var canDash: bool = true
var isDashing: bool = false

var dashUnlocked: bool = true

var shootUnlocked: bool = true

var canShoot: bool = true

var xDirection
var yDirection

@export var health: int = 100

func _physics_process(delta: float) -> void:
	if(disableSword):
		$Pluma.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		$Pluma.process_mode = Node.PROCESS_MODE_INHERIT
		
	if (dashUnlocked && canDash && Input.is_action_pressed("gameDodge")):
		isDashing = true
		canDash = false
		$dashDuration.start()
		$dashTimer.start()
	else:
		if (Input.is_action_pressed("gameShoot") && canShoot && shootUnlocked):
			fire()
			$shootTimer.start()
			canShoot = false
		if Input.is_action_pressed("gameAttack") and canAttack:
			if canCombo:
				$AnimationPlayer.play("attack2_" + prevDirection.to_lower())
				$attackCooldown.start()
				canAttack = false
				hasComboed = true
			else:
				$AnimationPlayer.play("attack1_" + prevDirection.to_lower())
				$attackCooldown.start()
				$comboTimer.start()
				canAttack = false
				canCombo = true
				hasComboed = false
		
		if Input.is_action_pressed("gameSprint"):
			speed = SpeedBase * SpeedMul
			AnimatedSprite.speed_scale = AnimMul
		else:
			speed = SpeedBase
			AnimatedSprite.speed_scale = 1
		
		xDirection = Input.get_axis("gameLeft", "gameRight")
		yDirection = Input.get_axis("gameUp", "gameDown")
		
	if (isDashing):
		velocity.x = prevDirectionX * speed * 3 * delta * scale.x
		velocity.y = prevDirectionY * speed * 3 * delta * scale.y
		$".".modulate = Color(1,0.2,0.2,1)
	else:
		velocity.x = xDirection * speed * delta * scale.x
		velocity.y = yDirection * speed * delta * scale.y
	
	if xDirection == 1:
		prevDirection = "Right"
		prevDirectionX = 1
		prevDirectionY = 0
	if xDirection == -1:
		prevDirection = "Left"
		prevDirectionX = -1
		prevDirectionY = 0
	if yDirection == 1:
		prevDirection = "Down"
		prevDirectionY = 1
		prevDirectionX = 0
	if yDirection == -1:
		prevDirection = "Up"
		prevDirectionY = -1
		prevDirectionX = 0
	
	if (xDirection == 0) and (yDirection == 0):
		AnimatedSprite.animation = "idle" + prevDirection
	else:
		AnimatedSprite.animation = "run" + prevDirection

	move_and_slide()
	
func _on_attack_cooldown_timeout() -> void:
	canAttack = true

func _on_combo_timer_timeout() -> void:
	canCombo = false
	if !hasComboed:
		$Pluma.visible = false


func _on_ready() -> void:
	dashUnlocked = get_parent().get_parent().get_meta("dashUnlocked")
	shootUnlocked = get_parent().get_parent().get_meta("shootUnlocked")


func _on_dash_duration_timeout() -> void:
	isDashing = false
	$".".modulate = Color(1,1,1,1)

func _on_dash_timer_timeout() -> void:
	canDash = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.get_meta("type") == "enemy"):
		health -= body.get_meta("damage")
		$CanvasLayer/ProgressBar.value = health
		$AnimationPlayer.play("hit")
		
	if (health <= 0):
		Signals.emit_signal("changeScene", get_parent(), get_parent().scene_file_path)

func fire() -> void:
	var bullet = bulletPath.instantiate()
	bullet.pos = $".".global_position
	bullet.dir = Vector2(prevDirectionX, prevDirectionY)
	get_parent().add_child(bullet)


func _on_shoot_timer_timeout() -> void:
	canShoot = true	
