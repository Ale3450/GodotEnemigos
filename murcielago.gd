extends CharacterBody2D


const SPEED = 300.0

var voy_a_izq = false

func _physics_process(delta: float) -> void:
	
	if (not $detectorSueloD.is_colliding() || $paredDerecha.is_colliding())   :
		voy_a_izq = true
	if (not $detectorSueloI.is_colliding() || $paredIzquierda.is_colliding():
		voy_a_izq = false
		
	position.y = -194
	
	if voy_a_izq:
		velocity.x = -SPEED
	else:
		velocity.x = SPEED
		
	move_and_slide()
