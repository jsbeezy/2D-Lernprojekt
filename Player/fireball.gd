extends Node2D

@onready var animationPlayer = $AnimationPlayer

var speed : int = 200
var direction : Vector2
var hadImpact : bool = false

func _ready():
	rotation = direction.angle()
	animationPlayer.play("Fly")

func _physics_process(delta):
	if !hadImpact:
		self.global_position += speed * direction * delta

func _on_animation_player_animation_finished(animName):
	if animName == "Explode":
		queue_free()

func _on_body_entered(body):
	if !body.is_in_group("Player"):
		hadImpact = true
		animationPlayer.play("Explode")

func _on_despawn_timer_timeout():
	hadImpact = true
	animationPlayer.play("Explode")

func _on_deal_damage_area_body_entered(body):
	if body.is_in_group("Enemies"):
		body.healthComponent.loseHealth(1)
