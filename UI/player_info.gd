extends Control

@onready var healthBar = $Panel/HealthBar
@onready var manaBar = $Panel/ManaBar

func updateHealthDisplay(index : int):
	healthBar.get_child(index).toggleActive()

func updateManaDisplay(index : int):
	manaBar.get_child(index).toggleActive()
