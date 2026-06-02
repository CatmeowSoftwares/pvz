class_name SeedPacket extends Control
signal planted
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var timer: Timer = $Timer
@onready var button: Button = $Button
@onready var plant_icon: TextureRect = $MarginContainer/VBoxContainer/PlantIcon
var price: int
var plant: PackedScene
var recharge: float 
func _ready() -> void:
	get_tree().current_scene.sun_changed.connect(_on_sun_changed)
	planted.connect(_on_planted)
	timer.wait_time = recharge
	progress_bar.max_value = recharge
func _process(delta: float) -> void:
	progress_bar.value = timer.time_left


func _on_button_pressed() -> void:
	Global.game.set_seed(self)
func _on_sun_changed(val):
	button.disabled =  val < price

func _on_timer_timeout() -> void:
	button.disabled = false

func _on_planted():
	timer.start()
	button.disabled = true
	
