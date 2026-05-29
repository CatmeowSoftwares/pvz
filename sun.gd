extends Area2D

var target_location: float 

func _physics_process(delta: float) -> void:
	if position.y < target_location:
		position.y += 32 * delta
var hovering: bool:
	set(value):
		hovering = value


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			Global.game.sun += 25
			queue_free()


func _on_timer_timeout() -> void:
	queue_free()
