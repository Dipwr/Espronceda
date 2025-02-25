extends CharacterBody2D

@export var SPEED = 300.0

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xDirection := Input.get_axis("gameLeft", "gameRight")
	var yDirection := Input.get_axis("gameUp", "gameDown")
	
	velocity.x = xDirection * SPEED * delta * scale.x
	velocity.y = yDirection * SPEED * delta * scale.y

	move_and_slide()
