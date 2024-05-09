extends Node2D

func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		if $ShopPopup.visible == true:
			$ShopPopup.visible = false
			
		else:
			$ShopPopup.visible = true

func _on_buy_button_pressed():
	#if Global.coin >= 10:
	#	Global.coin -= 10
		$ShopPopup/GunShop/buyButton.disabled = true
