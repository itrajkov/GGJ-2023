extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	var player = load("res://Actors/Player.tscn").instance()
	var connector_point_scene = load("res://Objects/ConnectorPoint.tscn")
	var resource_node_scene = load("res://Objects/ResourcePoint.tscn")
	var connector_points = [connector_point_scene.instance(), connector_point_scene.instance()]

	for i in connector_points.size():
		var point = connector_points[i]
		point.position = Vector2((i+1) * 200, 50)
		add_child(point)

	add_child(player)
	add_child(load("res://Objects/Background.tscn").instance())
	rng.randomize()
	for _i in range(rng.randi_range(5, 15)):
		var resource_noce = resource_node_scene.instance()
		add_child(resource_noce)
		var posx = rng.randf_range(50, 1920)
		var posy = rng.randf_range(50, 1080)
		# 						value					cooldown
		resource_noce.init(rng.randi_range(5, 20), rng.randf_range(1, 7), Vector2(posx, posy))
		resource_noce.position.x = posx+16
		resource_noce.position.y = posy-16
	player.set_current_point(connector_points[0])
	connector_points[0].connect_point(connector_points[1])
