extends Area2D

@onready var animationPlayer = $AnimationPlayer
@onready var endScreenResource : PackedScene = preload("res://UI/end_screen.tscn")
var gameEnd : bool = false

func _ready():
	animationPlayer.play("Idle")

func _on_area_entered(area):
	if area.is_in_group("Player") && !gameEnd:
		gameEnd = true
		var endScreen = endScreenResource.instantiate()
		get_parent().get_node("UI").add_child(endScreen)
