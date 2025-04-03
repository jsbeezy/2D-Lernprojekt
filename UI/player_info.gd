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

func updateHealthDisplay(currentHealth : int):
	for i in range(currentHealth):
		healthBar.get_child(i).activate()
	if currentHealth < 3:
		for i in range(3 - currentHealth):
			healthBar.get_child(i + currentHealth).deactivate()

func updateManaDisplay(currentMana : int):
	for i in range(currentMana):
		manaBar.get_child(i).activate()
	if currentMana < 2:
		for i in range(2 - currentMana):
			manaBar.get_child(i + currentMana).deactivate()
