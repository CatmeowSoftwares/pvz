extends Plant


@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	create_sun()
	timer.wait_time = randf_range(5, 10)
	timer.start()
func create_sun():
	var sun = preload("uid://di0adpklpvak5").instantiate()
	sun.position = position
	Global.game.add_child(sun)
	var tween = create_tween()
	tween.parallel().tween_property(sun, "position:x", position.x + randf_range(-4, 4), 0.1)
	tween.parallel().tween_property(sun, "position:y", position.y - 8, 0.1)
	tween.tween_property(sun, "position:y", position.y, 0.25)
