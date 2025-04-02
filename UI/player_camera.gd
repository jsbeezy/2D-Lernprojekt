extends Camera2D

@export_category("Follow Character")
@export var player : CharacterBody2D

@export_category("Camera Smoothing")
@export var smoothingEnabled : bool = true
@export_range(1, 10) var smoothingDistance : int = 10

var weight : float

func _ready():
	self.limit_top = -173
	self.limit_left = 0
	self.limit_bottom = 466
	global_position = getPlayerPositionWithOffset().floor()
	weight = float(smoothingDistance) / 100

func _physics_process(_delta):
	if player != null:
		var cameraPosition : Vector2
		
		if smoothingEnabled:
			cameraPosition = lerp(global_position, getPlayerPositionWithOffset(), weight)
		else:
			cameraPosition = getPlayerPositionWithOffset()
		
		global_position = cameraPosition.floor()

func getPlayerPositionWithOffset() -> Vector2:
	var offsetToPlayer : Vector2 = Vector2(0, -32)
	
	return player.global_position + offsetToPlayer
