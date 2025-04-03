extends Control

func activate():
	$Control/Heart.modulate = Color(1, 1, 1, 1)

func deactivate():
	$Control/Heart.modulate = Color(1, 1, 1, 0.2)
