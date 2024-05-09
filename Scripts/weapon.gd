extends CollisionShape2D

var canFire=true
var bullet=preload("res://Scenes/Bullet.tscn")

func _ready():
	set_as_top_level(true)


func _physics_process(delta):
	var mousePos=get_global_mouse_position()
	look_at(mousePos)
	get_parent().global_position
	$".".global_position=get_parent().global_position

	if Input.is_action_just_pressed("Fire") and canFire:
		var bulletinstance=bullet.instantiate()
		bulletinstance.rotation=get_global_mouse_position()
		bulletinstance.global_position=$".".global_position
		get_parent().add_child(bulletinstance)
		canFire=false
		await get_tree().create_timer(0.2)
		canFire=true
