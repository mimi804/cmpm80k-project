extends Area2D


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
