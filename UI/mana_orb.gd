extends Control

var isActive : bool = true

func toggleActive():
	isActive = !isActive
	if !isActive:
		$Control/ManaOrb.modulate = Color(1, 1, 1, 0.2)
	else:
		$Control/ManaOrb.modulate = Color(1, 1, 1, 1)
