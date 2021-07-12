extends KinematicBody2D

var bullet = preload("res://Enemy-Bullet/Bullet.tscn")
	
func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

func _colliding(area):
	if area.is_in_group("right"):
		print("emenies collide right")
		get_parent().global_position.y += 10
		get_parent().speed = -200
	if area.is_in_group("left"):
		print("emenies collide left")
		get_parent().global_position.y += 10
		get_parent().speed = 200
		
		
		
func _process(delta):
	while (true):
		yield(get_tree().create_timer(3.0), "timeout")
		var bulletInstance = bullet.instance()
		bulletInstance.position = Vector2(position.x, position.y+20)
		get_tree().get_root().add_child(bulletInstance)
		 
