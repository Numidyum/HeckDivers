extends Node2D

@export var spawns:Array[spawnInfo]=[]

@onready var player=get_tree().get_first_node_in_group("player")
var newenemy=preload("res://Scenes/enemy.tscn")

var time=0

func _on_timer_timeout():
	time +=1
	var enemyspawns=spawns
	for i in enemyspawns:
		if time>i.timeStart and time < i.timeEnd:
			if i.spawnDelayCounter<i.enemySpawnDelay:
				i.spawnDelayCounter+=1
			else:
				i.spawnDelayCounter=0
				var counter=0
				while counter<i.enemyNum:
					var enemyspawn=newenemy.instantiate()
					enemyspawn.global_position=get_random_position()
					add_child(enemyspawn)
					counter+=1
					
func get_random_position():
	var vpr=get_viewport_rect().size*randf_range(1.1,1.4)
	var topLeft=Vector2(player.global_position.x - vpr.x/2, player.global_position.y - vpr.y/2)
	var topRight=Vector2(player.global_position.x + vpr.x/2, player.global_position.y - vpr.y/2)
	var bottomLeft=Vector2(player.global_position.x - vpr.x/2, player.global_position.y + vpr.y/2)
	var bottomRight=Vector2(player.global_position.x + vpr.x/2, player.global_position.y - vpr.y/2)
	var posSide=["up","down","right","left"].pick_random()
	var spawnPos1=Vector2.ZERO
	var spawnPos2=Vector2.ZERO
	
	match posSide:
		"up":
			spawnPos1=topLeft
			spawnPos2=topRight
		"down":
			spawnPos1=bottomLeft
			spawnPos2=bottomRight
		"right":
			spawnPos1=topRight
			spawnPos2=bottomRight
		"left":
			spawnPos1=topLeft
			spawnPos2=bottomRight
	
	var xSpawn=randf_range(spawnPos1.x,spawnPos2.x)
	var ySpawn=randf_range(spawnPos1.y,spawnPos2.y)
	return Vector2(xSpawn,ySpawn)
	
