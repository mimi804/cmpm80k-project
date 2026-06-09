extends Area2D


@export var respawn_point: Vector2 = Vector2(0, 0)

func _on_body_entered(body):
	if body.name == "player":
		body.set_physics_process(false)  
		body.visible = false  
		await get_tree().create_timer(0.5).timeout 
		body.velocity = Vector2.ZERO
		body.position = respawn_point
		body.visible = true
		body.set_physics_process(true) 

func _ready():
	body_entered.connect(_on_body_entered)
