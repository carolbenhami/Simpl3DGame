extends Button


func _ready():
	pass
	
func _on_buttonquit_pressed():
	get_tree().change_scene("res://menu.tscn")
