extends Area2D

@onready var animationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.play("Idle")

func _on_area_entered(area):
	if area.is_in_group("Player"):
		var player = area.get_parent()
		player.healthComponent.gainHealth(1)
		player.playerInfo.updateHealthDisplay(player.healthComponent.health)
		queue_free()
