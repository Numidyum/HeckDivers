extends Area2D


func _on_body_entered(body):
		if body.name == "player":
			if body.AmmoPicked() == true:
				queue_free()
