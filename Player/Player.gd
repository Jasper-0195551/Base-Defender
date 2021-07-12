extends KinematicBody2D

var speed = 200
var bullet = preload("res://Bullet/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)
	$Area2D.connect("area_entered", self, "_colliding")
	$Area2D.connect("area_exited", self, "_not_colliding")


func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta, 0))
		
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if GlobalVariables.bulletInstanceCount < 3:
			var bulletInstance = bullet.instance()
			bulletInstance.position = Vector2(position.x, position.y-40)
			get_tree().get_root().add_child(bulletInstance)

func _colliding(area):
	if area.is_in_group("left"):
		print("left")
		position.x=50
	if area.is_in_group("right"):
		print("right")
		position.x=1230
	
func _not_colliding(area):
	pass
