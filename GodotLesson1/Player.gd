extends KinematicBody2D

var speed:int=500
var gravity:int=800
var jump:int=400

func _ready():
	pass # Replace with function body.


func _process(delta):
	var vel:Vector2= Vector2()
	if(Input.is_action_pressed("ui_right")):
		vel.x=1
	if(Input.is_action_pressed("ui_left")):
		vel.x=-1
	if(Input.is_action_pressed("ui_up")):
		vel.y=-1
	if(Input.is_action_pressed("ui_down")):
		vel.y=1
	
	var motion= vel * speed * delta
	
	move_and_collide(motion)
	
	
	
