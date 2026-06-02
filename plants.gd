class_name Plants extends Node


const FAST = 7.5
const SLOW = 30.0
const VERY_SLLOW = 50.0
static var plants: Array[Dictionary] = [
	{
		"Icon": preload("uid://dgwi5f8gb550t"),
		"Name": "Peashooter",
		"Price": 100,
		"Recharge": FAST,
		"Scene": preload("uid://c5su4tv7aumiu"),
	},
	{
		"Icon": preload("uid://b15sf18co1ick"),
		"Name": "Sunflower",
		"Price": 50,
		"Recharge": FAST,
		"Scene": preload("uid://bvbprm3ktkl6s"),
		
	},
	{
		"Icon": preload("uid://1tabhaq8td60"),
		"Name": "Wall Nut",
		"Price": 50,
		"Recharge": SLOW,
		"Scene": preload("uid://c8rkhyg4e6gmo"),
	},
]
