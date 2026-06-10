extends Area2D

var entered = false

func _on_Area2D_body_entered(body: Area2D):
	print("we made it into the body entered area")
	entered = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	##print("time is moving")
	if entered == true:
		print("process has detected entered")
		get_tree().change_scene("res://end_of_level.tscn")

##func _on_body_entered(body: Sprite2D) -> void:
##	if body.is_in_group("player"):
##		print("they are touchihng")
##		get_tree().change_scene_to_file("res://end_of_level.tscn")
