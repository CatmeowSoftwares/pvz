class_name Plants extends Node


const FAST = 1.0
const SLOW = 5.0
const VERY_SLLOW = 10.0
static var plants: Array[Dictionary] = [
	{
		"Icon": preload("uid://dgwi5f8gb550t"),
		"Name": "Peashooter",
		"Price": 100,
		"Cooldown": FAST,
		"Scene": preload("uid://c5su4tv7aumiu"),
	},
	{
		"Icon": preload("uid://b15sf18co1ick"),
		"Name": "Sunflower",
		"Price": 50,
		"Cooldown": FAST,
		"Scene": preload("uid://bvbprm3ktkl6s"),
		
	},
]
