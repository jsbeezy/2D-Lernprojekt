extends Node2D

@export var maxHealth : int = 1
var health : int

func _ready():
	health = maxHealth

func loseHealth(amount : int):
	print("losing")
	health -= amount
	if health <= 0:
		owner.die()
	else:
		owner.takeDamage()

func gainHealth(amount : int):
	if health + amount > maxHealth:
		health = maxHealth
	else:
		health += amount
