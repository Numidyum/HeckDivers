extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		var indicatorLabel = get_parent().get_node("Label")
		var indicatorLabelAnim = get_parent().get_node("Label/AnimationPlayer")
		indicatorLabel.visible = true
		indicatorLabelAnim.play("idle")


func _on_body_exited(body):
	if body.name == "player":
		var indicatorLabel = get_parent().get_node("Label")
		var indicatorLabelAnim = get_parent().get_node("Label/AnimationPlayer")
		indicatorLabelAnim.play("lost")
		
		
