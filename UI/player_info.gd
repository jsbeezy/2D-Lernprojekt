extends Control

@onready var healthBar = $Panel/HealthBar
@onready var manaBar = $Panel/ManaBar
@onready var timeLabel = $TimeLabel

var startTime : int
var timerStopped : bool = false
var currentTimeAsString = ""

func _ready():
	startTimer()

func _process(_delta):
	if !timerStopped:
		determineTimeSpent()
	timeLabel.text = currentTimeAsString

func startTimer():
	startTime = Time.get_ticks_msec()

func determineTimeSpent():
	var elapsedTime = Time.get_ticks_msec() - startTime
	var minutes = (elapsedTime / 60000) as int
	var seconds = ((elapsedTime % 60000) / 1000) as int
	
	currentTimeAsString = "%02d:%02d" % [minutes, seconds]

func updateHealthDisplay(index : int):
	healthBar.get_child(index).toggleActive()

func updateManaDisplay(index : int):
	manaBar.get_child(index).toggleActive()
