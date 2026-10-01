extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0
const escalado_movimiento = Vector2(1.2,1.2)
const escalado_quieto = Vector2(1.0,1.0)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#movimiento derecha e izquierda
	if Input.is_action_pressed("derecha"):
		velocity.x = SPEED
		$AnimatedSprite2D.scale= escalado_movimiento
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("caminando")
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -SPEED
		$AnimatedSprite2D.scale= escalado_movimiento
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("caminando")
	else:
		velocity.x = 0
		$AnimatedSprite2D.scale= escalado_quieto
		$AnimatedSprite2D.play("Quieto")

	move_and_slide()
