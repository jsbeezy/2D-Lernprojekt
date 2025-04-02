extends CharacterBody2D

@onready var healthComponent = $HealthComponent
@onready var knockbackComponent = $KnockbackComponent
@onready var animationPlayer = $AnimationPlayer
@onready var sprite = $AnimatedSprite
@onready var takeDamageHitbox : CollisionShape2D = $TakeDamageArea/TakeDamageHitbox
@onready var projectilesNode = $"../../Projectiles"
@onready var fireballPath : PackedScene = preload("res://Player/fireball.tscn")
@onready var playerInfo = $"../../UI/PlayerInfo"

@export var speed: int = 200
@export var jumpVelocity: int = -350

var mana : int = 2
var maxMana : int = 2
var canDoubleJump : bool = false
var animationLocked : bool = false
var isDead : bool = false

func _physics_process(delta):
	if isDead:
		return
	apply_gravity(delta)
	if !animationLocked:
		handle_animation()
	handle_movement()
	handle_fireball()
	if is_on_floor() or canDoubleJump:
		handle_jump()
	move_and_slide()

func handle_animation():
	if velocity.y < 0:
		animationPlayer.play("Jump")
	elif velocity.y > 0:
		animationPlayer.play("Fall")
	elif velocity.y == 0:
		if velocity.x == 0:
			animationPlayer.play("Idle")
		else:
			animationPlayer.play("Run")

func apply_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_movement():
	var direction = Input.get_axis("Left", "Right")
	if direction and !animationLocked:
		velocity.x = direction * speed
		sprite.scale.x = direction
	else:
		velocity.x = 0

func handle_jump():
	if Input.is_action_just_pressed("Space"):
		if !is_on_floor():
			canDoubleJump = false
		else:
			canDoubleJump = true
		velocity.y = jumpVelocity

func handle_fireball():
	if Input.is_action_just_pressed("LeftClick") and mana > 0 and !animationLocked:
		animationPlayer.play("Shoot")
		animationLocked = true
		mana -= 1
		playerInfo.updateManaDisplay(mana)
		await get_tree().create_timer(0.2).timeout
		var fireballInstance = fireballPath.instantiate()
		var playerPositionWithOffset : Vector2 = self.global_position + Vector2(0, -14)
		fireballInstance.global_position = playerPositionWithOffset
		fireballInstance.direction = (get_global_mouse_position() - playerPositionWithOffset).normalized()
		projectilesNode.add_child(fireballInstance)

func takeDamage():
	playerInfo.updateHealthDisplay(healthComponent.health)
	Engine.time_scale = 0.5
	takeDamageHitbox.set_deferred("disabled", true)
	animationLocked = true
	animationPlayer.play("Hurt")

func die():
	playerInfo.updateHealthDisplay(healthComponent.health)
	Engine.time_scale = 1
	knockbackComponent.isActive = false
	isDead = true
	animationPlayer.play("Hurt")

func gainMana(amount : int):
	if mana + amount > maxMana:
		mana = maxMana
	else:
		mana += amount

func _on_animation_player_animation_finished(animName):
	Engine.time_scale = 1
	if animName == "Shoot":
		animationLocked = false
	if animName == "Hurt":
		takeDamageHitbox.set_deferred("disabled", false)
		animationLocked = false
		if isDead:
			takeDamageHitbox.set_deferred("disabled", true)
			animationPlayer.play("Die")
	if animName == "Die":
		get_tree().reload_current_scene()
