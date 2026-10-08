extends CharacterBody2D


const SPEED = 500.0
const YSPEED = -200
const JUMP_VELOCITY = -700.0
var atacando = false
var muerte = false
var repeticionMuerte = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and !muerte:
		velocity += get_gravity() * delta
	
	#movimiento derecha e izquierda
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("derecha") and muerte == false:
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("izquierda") and muerte == false:
		velocity.x = -SPEED
		$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = 0
	
	#animaciones
	if atacando == true:
		$AnimatedSprite2D.play("puño")
	elif not is_on_floor() and muerte == false:
		atacando = false
		$AnimatedSprite2D.play("salto")
	elif velocity.x != 0 and muerte == false:
		atacando = false
		$AnimatedSprite2D.play("caminando")
	elif Input.is_action_just_pressed("puño") and muerte == false:
		atacando = true
		$AnimatedSprite2D.play("puño")
	elif velocity.x == 0 and velocity.y == 0 and muerte == false:
		atacando = false
		$AnimatedSprite2D.play("Quieto")

	move_and_slide()


func paraTerminarElPuño() -> void:
	if $AnimatedSprite2D.frame ==  5:
		atacando = false

func _on_area_muerte_body_entered(body: Node2D) -> void:
	if body.name == "Protagonista":
		muerte = true
		$AnimatedSprite2D.play("muerte")
		velocity.y = YSPEED
		await get_tree().create_timer(2).timeout
		get_tree().quit()


func muerte2(body: Node2D) -> void:
	if body.name == "Protagonista":
		muerte = true
		$AnimatedSprite2D.play("muerte")
		velocity.y = YSPEED
		await get_tree().create_timer(2).timeout
		get_tree().quit()
