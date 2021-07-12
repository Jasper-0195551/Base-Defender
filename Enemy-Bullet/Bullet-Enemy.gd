extends KinematicBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)



func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, +speed*delta*0.4))
	if (collidedObject):
		print(collidedObject.collider.name)
		#if collidedObject.is_in_group("enemy"):
		if "Enemy" in collidedObject.collider.name:
			pass
			#collidedObject.get_collider().queue_free()
		else:
			if "Player" in collidedObject.collider.name:
				collidedObject.get_collider().queue_free()
				get_tree().change_scene("res://losess.tscn")
				#then sent to losses sceen
			queue_free()
			GlobalVariables.enemyBulletInstanceCount -= 1
			print("Enemy Bullets: ", GlobalVariables.enemyBulletInstanceCount)
			
			
		
