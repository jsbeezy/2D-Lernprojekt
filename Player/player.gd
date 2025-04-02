extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var sprite = $AnimatedSprite

@export var speed: int = 200
@export var jump_velocity: int = -400

func _physics_process(delta):
	handle_animation()
	apply_gravity(delta)
	handle_movement()
	handle_jump()
	move_and_slide()

func handle_animation():
	if velocity.y < 0:
		animation_player.play("Jump")
	elif velocity.y > 0:
		animation_player.play("Fall")
	elif velocity.y == 0:
		if velocity.x == 0:
			animation_player.play("Idle")
		else:
			animation_player.play("Run")

func apply_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_movement():
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
		sprite.scale.x = direction
	else:
		velocity.x = 0

func handle_jump():
	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = jump_velocity
