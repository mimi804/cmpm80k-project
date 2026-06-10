extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "player":
		body.set_physics_process(false)
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/end_of_level.tscn")
