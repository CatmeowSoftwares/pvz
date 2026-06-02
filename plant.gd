class_name Plant extends Character


func eat():
	health -= 1
	if health <= 0:
		death.emit()
