extends Area2D

@onready var animationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.play("Idle")

func _on_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().reload_current_scene()
