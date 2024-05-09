extends Area2D
@export var speed=150
var dmg

func _physics_process(delta):
	position += transform.x * speed * delta
	await get_tree().create_timer(0.01)


func setDamage(damage):
	print(damage)
	dmg = damage
func _on_body_entered(body):
	if body.name=="player":
		pass
	else:
		if body.is_in_group("enemy"):
			body.dealDamage(dmg)
			queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
