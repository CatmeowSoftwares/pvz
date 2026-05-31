extends Zombie


func _physics_process(delta: float) -> void:
	if !eating: 
		position.x -= 16 * delta
