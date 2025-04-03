extends Control

func _ready():
	get_tree().paused = true
	$ani.play("fadeIn")

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
