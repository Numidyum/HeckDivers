extends Node2D

func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		if $ShopPopup.visible == true:
			$ShopPopup.visible = false
			
		else:
			$ShopPopup.visible = true
			
		if $ShopPopup2.visible == true:
			$ShopPopup2.visible = false
			
		else:
			$ShopPopup2.visible = true

func _on_buy_button_pressed():
	if Global.Sample >= 10:
		Global.Sample -= 10
		$ShopPopup/GunShop/buyButton.disabled = true
		Global.WeaponUpgrade = true


func _on_ammo_pressed():
		if Global.Sample >= 2:
			print("Ammo Bought")
			Global.Sample -= 2
			$ShopPopup/GunShop/buyButton.disabled = true
			Global.Ammo += 50
