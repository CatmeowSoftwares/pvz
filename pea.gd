extends Area2D

func _physics_process(delta: float) -> void:
	position.x += 256 * delta

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	area.normal_damage()
	queue_free()
