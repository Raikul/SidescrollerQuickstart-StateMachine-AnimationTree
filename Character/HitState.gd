extends State

class_name HitState
@export var damageable : Damageable
@export var dead_state : State
@export var dead_animation_node : String = "dead"
@export var character_state_machine : CharacterStateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	damageable.connect("on_hit", on_damageable_hit)
	pass # Replace with function body.

func on_damageable_hit(node:Node, damage_amount : int):
	if (damageable.health > 0):
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state",dead_state)
		playback.travel(dead_animation_node)
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
