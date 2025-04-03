extends Control

func _ready():
	$ani.play("fadeIn")

func _on_restart_pressed():
	get_tree().reload_current_scene()
