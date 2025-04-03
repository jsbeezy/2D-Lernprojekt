extends Area2D

@onready var animationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.play("Idle")

func _on_area_entered(area):
	if area.is_in_group("Player"):
		var player = area.get_parent()
		player.gainMana(1)
		player.playerInfo.updateManaDisplay(player.mana)
		queue_free()
