extends Panel

@export var bodyLabel : Label

@export var animate : bool

@export var secPerChar : float

@export var charNum = 0

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if animate && (time > secPerChar):
		bodyLabel.visible_characters = charNum
		charNum += 1
		time = 0
