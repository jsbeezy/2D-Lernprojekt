extends Area2D

@onready var animationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.play("Idle")

func _on_area_entered(area):
	if area.is_in_group("Player"):
		var player = area.get_parent()
		var manaBeforeItemPickup = player.mana
		player.gainMana(1)
		if manaBeforeItemPickup != player.maxMana:
			player.playerInfo.updateManaDisplay(player.mana - 1)
		queue_free()
