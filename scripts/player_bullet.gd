extends CharacterBody2D

var pos :Vector2
@export var acc = 500
@export var speed = 200

func _ready() -> void:
	global_position = pos

func _physics_process(delta: float) -> void:
	acc += 150/($Timeout.time_left+0.5)*delta
	look_at(get_parent().get_node("Player").position)
	velocity += Vector2(acc, 0).rotated(rotation)*delta
	rotation = velocity.angle()
	velocity = velocity.normalized() * speed
	move_and_slide()


func _on_timer_timeout() -> void:
	$".".queue_free()
