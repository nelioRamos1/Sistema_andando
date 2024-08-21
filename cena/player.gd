extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $anim
const SPEED = 180.0
const JUMP_VELOCITY = -250.0


func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		anim.play("andando")
		velocity.x = direction * SPEED
			
	else:
		anim.play("parado")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x < 0:
		anim.flip_h = true
	
		

	move_and_slide()
