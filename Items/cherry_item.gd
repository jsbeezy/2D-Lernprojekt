extends Area2D

@onready var animationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.play("Idle")

func _on_area_entered(area):
	if area.is_in_group("Player"):
		var player = area.get_parent()
		var healthBeforeItemPickup = player.healthComponent.health
		player.healthComponent.gainHealth(1)
		if healthBeforeItemPickup != player.healthComponent.maxHealth:
			player.playerInfo.updateHealthDisplay(player.healthComponent.health - 1)
		queue_free()
