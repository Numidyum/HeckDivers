extends Area2D



func _on_body_entered(body):
		if body.name == "player":
			Global.Sample += 2
			
			queue_free()
