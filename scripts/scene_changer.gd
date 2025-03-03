extends Node

@onready var anim = $AnimationPlayer

var thisScene
var nextScene

func _ready() -> void:
	Signals.connect("changeScene", changeScene)

func changeScene(thisWorld: Variant, worldPath: String) -> void:
	anim.play("fade out")
	thisScene = thisWorld
	nextScene = load(worldPath).instantiate()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade out":
		thisScene.queue_free()
		$".".add_child(nextScene)
		anim.play("fade in")
