class_name Zombie extends Area2D
signal death
var health: int
var eating: bool

var plant_eating: Plant
func _ready() -> void:
	death.connect(_on_death)
func _on_area_entered(area: Area2D) -> void:
	plant_eating = area as Plant
	eating = true


func _on_area_exited(area: Area2D) -> void:
	plant_eating = null
	eating = false
func eat():
	plant_eating.queue_free()


func normal_damage():
	health -= 1
	if health <= 0:
		death.emit()

func _on_death():
	queue_free()
func _on_eat_timer_timeout() -> void:
	if plant_eating:
		eat()
