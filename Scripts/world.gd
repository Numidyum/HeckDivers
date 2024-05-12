extends Node2D

func _physics_process(delta):
	if Global.merchantentered == true:
		if Input.is_action_just_pressed("interact"):
			if $player/CanvasLayer2/ShopPopup.visible == true:
				$player/CanvasLayer2/ShopPopup.visible = false
			
			else:
				$player/CanvasLayer2/ShopPopup.visible = true
			

func _on_buy_button_pressed():
	if Global.Sample >= 10:
		Global.Sample -= 10
		$player/CanvasLayer2/ShopPopup/GunShop/NBuy.visible = false
		$player/CanvasLayer2/ShopPopup/Liberator/TextureProgressBar.value = 8
		$player/CanvasLayer2/ShopPopup/GunShop/Bought.visible = true
		$player/CanvasLayer2/ShopPopup/GunShop/buyButton.disabled = true
		$player/CanvasLayer2/ShopPopup/GunShop/Ammo.visible = false
		Global.WeaponUpgrade = true



func _on_texture_button_pressed():
	$player/CanvasLayer2/ShopPopup/Liberator.visible = true
	$player/CanvasLayer2/ShopPopup/GunShop/buyButton.disabled = false
	$player/CanvasLayer2/ShopPopup/GunShop/Ammo.visible = false
	$player/CanvasLayer2/ShopPopup/GunShop/Ammo2.visible = false


func _on_button_pressed():
	$player/CanvasLayer2/ShopPopup/Liberator.visible = false
	$player/CanvasLayer2/ShopPopup/GunShop/Ammo2.visible = true
	if Global.Sample >= 2:
		Global.Sample -= 2
		Global.Ammo += 50
		$player/CanvasLayer2/ShopPopup/GunShop/Ammo2/Ammocount.text = str(Global.Ammo)
		$player/CanvasLayer2/ShopPopup/GunShop/Ammo.visible = true
		$player/CanvasLayer2/ShopPopup/GunShop/Button.disabled = true
		$player/CanvasLayer2/ShopPopup/GunShop/Ammo2/Timer.start()
		



func _on_timer_timeout():
	$player/CanvasLayer2/ShopPopup/GunShop/Ammo.visible = false
	$player/CanvasLayer2/ShopPopup/GunShop/Button.disabled = false
