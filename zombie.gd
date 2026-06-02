class_name Zombie extends Character
var eating: bool
@onready var eat_timer: Timer = $EatTimer

var plant_eating: Plant

func _on_area_entered(area: Area2D) -> void:
	plant_eating = area as Plant
	eating = true
	eat_timer.start()


func _on_area_exited(area: Area2D) -> void:
	plant_eating = null
	eating = false
func eat():
	plant_eating.eat();


func normal_damage():
	health -= 1
	if health <= 0:
		death.emit()


func _on_eat_timer_timeout() -> void:
	if plant_eating:
		eat()
	eat_timer.start()
