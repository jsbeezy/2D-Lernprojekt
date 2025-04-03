extends Control

func activate():
	$Control/ManaOrb.modulate = Color(1, 1, 1, 1)

func deactivate():
	$Control/ManaOrb.modulate = Color(1, 1, 1, 0.2)
