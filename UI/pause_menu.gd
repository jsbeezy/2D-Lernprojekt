extends Control

func _ready():
	get_tree().paused = true

func _process(_delta):
	if Input.is_action_just_pressed("Escape"):
		unpause()

func unpause():
	if get_tree():
		get_tree().paused = false
		self.queue_free()

func _on_continue_button_pressed():
	print("JOOOOO")
	unpause()

func _on_restart_button_pressed():
	unpause()
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()
