extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		var new_bullet = bullet.instance()
		new_bullet.bullet_mode = new_bullet.BULLET_MODE.DIRT
		new_bullet.voxel_terrain = get_parent()
		add_child(new_bullet)
	if Input.is_action_pressed("ui_right"):
		var new_bullet = bullet.instance()
		new_bullet.bullet_mode = new_bullet.BULLET_MODE.AIR
		new_bullet.voxel_terrain = get_parent()
		add_child(new_bullet)
	pass
