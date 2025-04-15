extends Node2D


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")


func _on_setting_pressed() -> void:
	$CenterContainer/MAIN_MENU.visible=false
	$CenterContainer/seteing_menu.visible=true


func _on_credits_pressed() -> void:
	$CenterContainer/MAIN_MENU.visible=false
	$CenterContainer/credits_menu.visible=true


func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.


func _on_back_pressed() -> void:
	$CenterContainer/MAIN_MENU.visible=true
	$CenterContainer/seteing_menu.visible=false
	$CenterContainer/credits_menu.visible=false
	

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)



func _on_mainslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Matster"),value)


func _on_musicslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("MUSIC"),value)


func _on_sfxslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Matster"),value)
