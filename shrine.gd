extends Area2D

var activated = false
var time = 0
var direction

@export var shrine_status:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+=delta
	if time>3 && activated == false:
		activated = true
		direction = get_tree().get_nodes_in_group("Player")[0].direction
	
		match get_node("../").get_groups()[1]:
			"shrinemain1":
				if direction == "left":
					get_children()[0].disabled = true
					get_tree().get_nodes_in_group("BaseM1")[0].visible = true
					for child in get_node("../").get_children():
						child.visible = false
			"shrinemain2":
				if direction == "right":
					get_children()[0].disabled = true
					get_tree().get_nodes_in_group("BaseM2")[0].visible = true
					for child in get_node("../").get_children():
						child.visible = false
			"shrinesecret":
				pass	
			"shrinegatefake":
				pass
			"shrinegate1":
				if direction == "right":
					get_children()[0].disabled = true
					get_tree().get_nodes_in_group("BaseG1")[0].visible = true
					for child in get_node("../").get_children():
						child.visible = false
			"shrinegate2":
				if direction == "left":
					get_children()[0].disabled = true
					get_tree().get_nodes_in_group("BaseG2")[0].visible = true
					for child in get_node("../").get_children():
						child.visible = false


func _on_body_entered(body):
	if activated:
		get_tree().get_nodes_in_group("InteractionInterface")[0].visible = true	
		shrine_status = true


func _on_body_exited(body):
	if activated && get_tree().get_nodes_in_group("InteractionInterface").size() > 0:
		get_tree().get_nodes_in_group("InteractionInterface")[0].visible = false
		shrine_status = false
