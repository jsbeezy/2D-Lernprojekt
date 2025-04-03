extends Node2D

@onready var pauseMenuResource : PackedScene = preload("res://UI/pause_menu.tscn")
var pauseMenuInstance : Control = null
@onready var ui = $UI

func _ready():
	Engine.time_scale = 1

func _process(_delta):
	if Input.is_action_just_pressed("Escape") and !pauseMenuInstance:
		pauseMenuInstance = pauseMenuResource.instantiate()
		ui.add_child(pauseMenuInstance)
