extends Area2D

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta


func _on_area_2d_body_entered(body):
	if time > 3:
		if get_tree().get_nodes_in_group("Player")[0] == body:
			get_tree().get_first_node_in_group("Player").inside = false
