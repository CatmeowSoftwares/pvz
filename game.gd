class_name Game extends Node2D
signal sun_changed(value: int)


@onready var label: Label = $UI/TextureRect/Label

@onready var camera: Camera2D = $Camera2D
@onready var seed_packets: HBoxContainer = $UI/SeedPackets
@onready var plant_preview: Sprite2D = $GridSomethingSomethingSomething/PlantPreview
@onready var cursor_plant_preview: Sprite2D = $GridSomethingSomethingSomething/CursorPlantPreview

var current_seed_selected: SeedPacket
var is_on_field: bool
var plants = []
const ZOMBIE_CAM_POS = 400.0

var sun: int = 100:
	set(value):
		sun = value
		sun_changed.emit(value)

func move_camera_to_zombies():
	var tween = create_tween()
	tween.tween_property(camera, "position:x", ZOMBIE_CAM_POS, 0.5).set_ease(Tween.EASE_IN_OUT)
func move_camera_to_plants():
	var tween = create_tween()
	tween.tween_property(camera, "position:x", 0, 2.0)
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		cursor_plant_preview.position = event.global_position
		plant_preview.position = event.global_position.snapped(Vector2(48, 48))
	if event is InputEventMouseButton:
		if event.pressed and not event.is_echo():
			if current_seed_selected:
				if event.button_index == MOUSE_BUTTON_LEFT:
					#if is_on_field:
					plant(current_seed_selected.price, current_seed_selected.plant.instantiate())
				if event.button_index == MOUSE_BUTTON_RIGHT:
					remove_current_selected_seed()
func _process(delta: float) -> void:
	plant_preview.visible = true#is_on_field and current_seed_selected
func _ready() -> void:
	plants.resize(45)
	Global.game = self
	sun_changed.connect(_on_sun_changed)
	sun_changed.emit(sun)
	for plant_data in Plants.plants:
		var seed_packet = preload("uid://cpgfysmiyrxr0").instantiate()
		seed_packet.plant = plant_data["Scene"]
		seed_packet.price = plant_data["Price"]
		seed_packet.recharge = plant_data["Recharge"]
		seed_packets.add_child(seed_packet)
		seed_packet.plant_icon.texture = plant_data["Icon"]
		
	#move_camera_to_zombies()
func plant(cost: int, plant: Plant):
	if sun < cost:
		return
	if plants[pos_to_idx(plant_preview.position)/48] != null:
		print("sad")
		return
	sun -= cost
	current_seed_selected.planted.emit()
	current_seed_selected = null
	plant.position = plant_preview.position
	plants[pos_to_idx(plant_preview.position)/48] = plant
	add_child(plant)
	
	print(plant_preview.position/32)
	print(pos_to_idx((plant_preview.position/48)))
	cursor_plant_preview.hide()
	

func remove_current_selected_seed():
	current_seed_selected = null
	cursor_plant_preview.hide()

func pos_to_idx(pos: Vector2i) -> int:
	return pos.x + pos.y * 9
func set_seed(seed: SeedPacket):
	cursor_plant_preview.texture = seed.plant_icon.texture
	plant_preview.texture = seed.plant_icon.texture
	current_seed_selected = seed
	cursor_plant_preview.show()
	plant_preview.show()

func _on_sun_changed(value: int):
	label.text = str(value)


func _on_area_2d_mouse_entered() -> void:
	is_on_field = true


func _on_area_2d_mouse_exited() -> void:
	is_on_field = false


func _on_timer_timeout() -> void:
	spawn_zombie()


func spawn_zombie():
	var zombie = preload("uid://dhb3jbw5nc40h").instantiate()
	zombie.position = Vector2(640, snapped(randf_range(48, 48*5), 48))
	add_child(zombie)


func _on_sun_timer_timeout() -> void:
	spawn_sun()

func spawn_sun():
	var sun = preload("uid://di0adpklpvak5").instantiate()
	sun.position = Vector2(randf_range(256, 512), 0)
	sun.target_location = randf_range(256, 340)
	add_child(sun)
