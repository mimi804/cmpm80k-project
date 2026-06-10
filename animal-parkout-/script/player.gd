extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 350.0
const JUMP_VELOCITY = -730.0
var jump_count = 0 
const MAX_JUMPS = 2 


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 1.05 * delta
		sprite.animation = "jump left"
	else:
		jump_count = 0 
		if velocity.x > 1 or velocity.x < -1:
			sprite.animation = "run left"
		else:
			sprite.animation = "idle left"
	
	
	

	# Handle jump
	if Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY  
		jump_count += 1 

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if direction == 1.0:
		sprite.flip_h = true
		sprite.offset.x = -6
	elif direction == -1.0:
		sprite.flip_h = false
		sprite.offset.x = 0
