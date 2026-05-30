extends Plant
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var timer: Timer = $Timer


func _physics_process(delta: float) -> void:
	if timer.is_stopped():
		var pea = preload("uid://bhta00lr0gmdy").instantiate()
		get_tree().root.add_child(pea)
		pea.global_position = ray_cast.global_position
		timer.start()
		
