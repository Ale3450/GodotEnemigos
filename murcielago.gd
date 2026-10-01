extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	if $detectorSueloD.is_colliding():
		velocity.x=-SPEED
	elif $detectorSueloI.is_colliding():
		velocity.x = SPEED  
	move_and_slide()
