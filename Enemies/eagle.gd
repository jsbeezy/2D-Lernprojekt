extends CharacterBody2D

@onready var healthComponent = $HealthComponent
@onready var cooldownTimer = $CooldownTimer
@onready var animationPlayer = $AnimationPlayer
@onready var dealDamageArea = $DealDamageArea

var speed : int  = 50
var movingUp : bool = true
var isDead : bool = false

func _ready():
	movingUp = randi() % 2 == 0
	animationPlayer.play("Fly")

func _physics_process(_delta):
	if isDead:
		return
	if movingUp:
		velocity.y = -speed
	else:
		velocity.y = speed
	velocity.x = 0
	move_and_slide()

func die():
	$DealDamageArea.monitoring = false
	isDead = true
	animationPlayer.play("Die")

func _on_animation_player_animation_finished(animName):
	if animName == "Die":
		queue_free()

func _on_deal_damage_area_area_entered(area):
	if area.is_in_group("Player"):
		area.get_parent().knockbackComponent.handleKnockback(self.global_position)
		area.get_parent().healthComponent.loseHealth(1)
		dealDamageArea.collision_mask = 8
		cooldownTimer.start()

func _on_direction_change_timer_timeout():
	movingUp = !movingUp

func _on_cooldown_timer_timeout():
	dealDamageArea.collision_mask = 1
