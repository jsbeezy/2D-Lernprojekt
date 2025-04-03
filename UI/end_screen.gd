extends Control

var playerInfo

func _ready():
	playerInfo = get_parent().get_node("PlayerInfo")
	$Base/endTimeText.text = "Gebrauchte Zeit:\n " + playerInfo.currentTimeAsString
	get_tree().paused = true
	$ani.play("fadeIn")

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
