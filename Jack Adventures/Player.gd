extends KinematicBody2D

var direction=0

var velocity =Vector2()

const SPEED = 400
const GRAVITY=100
const JUMP=2000
onready var jack = get_node("Sprite")

func _ready():
	pass # Replace with function body.


func _process(_delta):
	direction =   Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 

	if(Input.is_action_pressed("ui_select")):
		if (is_on_floor()):
			velocity.y += -JUMP
		
	velocity.y+= GRAVITY
	velocity.x =direction*SPEED
	
	velocity = move_and_slide(velocity,Vector2.UP)
	update_animation()
	
func update_animation():
	if(is_on_floor()):
		if(direction == 1):
			jack.flip_h=false
			jack.play("Walk")
		elif(direction==-1):
			jack.flip_h=true
			jack.play("Walk")
		else:
			jack.play("Idle")
	else:
		if(direction==1):
			jack.flip_h=false
		elif(direction==-1):
			jack.flip_h=true
		if(Input.is_action_just_pressed("ui_select")):
			jack.play("Jump")
		else:
			jack.play("Fall")
	if(jack.flip_h==true and jack.offset.x>0):
		jack.offset*=-1
	if(jack.flip_h==false and jack.offset.x<0):
		jack.offset*=-1
		
			
	


