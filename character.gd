class_name Character extends Area2D
signal death

@export var health: int

func _ready() -> void:
	death.connect(_on_death)


func _on_death():
	queue_free()
