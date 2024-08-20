extends Node
class_name Damageable

signal on_hit(node: Node, damage_taken: int)

@export var health : float = 30:
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health )
		print("health: " + str(health))
		print("value: " + str(value))
		health = value


func hit(damage : int):
	health -= damage
	
	emit_signal("on_hit", get_parent(), damage)
	#if (health <= 0):
		#get_parent().queue_free()
