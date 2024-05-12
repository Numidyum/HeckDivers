extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		var indicatorLabel = get_parent().get_node("Label")
		var indicatorLabelAnim = get_parent().get_node("Label/AnimationPlayer")
		indicatorLabel.visible = true
		indicatorLabelAnim.play("idle")
		Global.merchantentered = true


func _on_body_exited(body):
	if body.name == "player":
		var indicatorLabel = get_parent().get_node("Label")
		$"../../player/CanvasLayer2/ShopPopup".visible = false
		var indicatorLabelAnim = get_parent().get_node("Label/AnimationPlayer")
		indicatorLabelAnim.play("lost")
		Global.merchantentered = false
		
