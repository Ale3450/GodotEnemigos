extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#movimiento derecha e izquierda
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("derecha"):
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -SPEED
		$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = 0
	
	#animaciones
	if not is_on_floor():
		$AnimatedSprite2D.play("salto")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("caminando")
	else:
		$AnimatedSprite2D.play("Quieto")

	move_and_slide()
