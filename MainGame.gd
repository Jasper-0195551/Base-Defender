extends Control

export(int) var countdownMax
var currentTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $HUD/MenuButtons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	while currentTimer > 0:
		print(currentTimer)
		$HUD/Countdown.text = str(currentTimer)
		yield(get_tree().create_timer(1.0), "timeout")
		currentTimer -= 1
	$HUD/Countdown.text = str(currentTimer)
	print("Game Over")



func _on_Button_pressed(scene_to_load):
	print("Changing Scene...")
	print(scene_to_load)
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_to_load)





	#Change to next scene
# Add code , every second, update a label in the UI with an increased number.
