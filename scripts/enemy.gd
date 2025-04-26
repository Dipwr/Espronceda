extends CharacterBody2D

@export var health: int = 100




func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body.get_meta("type") == "weapon"):
		health -= body.get_meta("damage")
