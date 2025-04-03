extends CharacterBody2D

@onready var healthComponent = $HealthComponent
@onready var coolDownTimer = $CooldownTimer
@onready var animationPlayer = $AnimationPlayer
@onready var dealDamageArea = $DealDamageArea
@onready var sprite = $AnimatedSprite

var speed : int  = 200
var jumpVelocity = -200
var isDead : bool = false
var isJumping : bool = false
var direction : int
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	direction = 1
	animationPlayer.play("Idle")

func _physics_process(delta):
	if isDead:
		return
	
	apply_gravity(delta)
	
	if isJumping:
		velocity.x = direction * speed
	else:
		velocity.x = 0
	
	if velocity.y < 0:
		animationPlayer.play("Jump")
	elif velocity.y > 0:
		animationPlayer.play("Fall")
	elif is_on_floor():
		isJumping = false
		if velocity.x == 0:
			animationPlayer.play("Idle")
	
	move_and_slide()
	
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
func jump():
	velocity.y = jumpVelocity
	isJumping = true
	
func die():
	dealDamageArea.monitoring = false
	isDead = true
	animationPlayer.play("Die")
	
func _on_animation_player_animation_finished(animName):
	if animName == "Idle" and not isJumping:
		jump()
		direction *= -1
		sprite.flip_h = direction > 0
	elif animName == "Die":
		queue_free()
	
func _on_deal_damage_area_area_entered(area):
	if area.is_in_group("Player"):
		area.get_parent().knockbackComponent.handleKnockback(self.global_position)
		area.get_parent().healthComponent.loseHealth(1)
		dealDamageArea.collision_mask = 8
		coolDownTimer.start()
	
func _on_cooldown_timer_timeout():
	dealDamageArea.collision_mask = 1
