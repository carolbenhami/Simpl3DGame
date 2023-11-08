extends KinematicBody

var speed = Vector3(0,0,0)
const VELOCITY = 12
const ROTSPEED = 9

func _ready():
	pass
	
func _physics_process(_delta): 
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		speed.x=0
	elif Input.is_action_pressed("ui_right"):
		speed.x=VELOCITY
		$MeshInstance.rotate_z(deg2rad(-ROTSPEED))	
	elif Input.is_action_pressed("ui_left"):
		speed.x=-VELOCITY	
		$MeshInstance.rotate_z(deg2rad(ROTSPEED))
	else:
		speed.x=lerp(speed.x,0,0.1)
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		speed.z=0
	elif Input.is_action_pressed("ui_up"):
		speed.z=-VELOCITY
		$MeshInstance.rotate_x(deg2rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_down"):
		speed.z=VELOCITY
		$MeshInstance.rotate_x(deg2rad(ROTSPEED))
	else:
		speed.z=lerp(speed.x,0,0.1)
	move_and_slide(speed)
	


func _on_enemy_body_entered(body):
	if body.name=="Steve":
		get_tree().change_scene("res://gameover.tscn")
