extends Node2D

@export var knockbackStrength: float = 800.0
@export var knockbackDecay: float = 0.1

var knockbackVelocity : Vector2 = Vector2.ZERO
var isActive : bool = false
var direction : Vector2

func handleKnockback(sourcePosition: Vector2, multiplier : float = 1):
	direction = (global_position - sourcePosition)
	direction = direction.normalized()
	knockbackVelocity.x = direction.x * (knockbackStrength * multiplier)
	knockbackVelocity.y = direction.y * (knockbackStrength * multiplier)
	isActive = true

func _physics_process(delta: float):
	if isActive:
		owner.global_position += knockbackVelocity * delta
		knockbackVelocity = lerp(knockbackVelocity, Vector2.ZERO, knockbackDecay)
		
		if knockbackVelocity.length() < 10.0:
			owner.velocity = Vector2.ZERO
			isActive = false

func reset():
	if not isActive:
		pass
