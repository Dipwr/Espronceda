extends CharacterBody2D

var pos :Vector2
var dir :Vector2
@export var speed = 200

func _ready() -> void:
	global_position = pos
	velocity = dir*speed
	rotation = velocity.angle()

func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_timer_timeout() -> void:
	$".".queue_free()
