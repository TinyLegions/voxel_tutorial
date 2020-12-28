extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum BULLET_MODE {DIRT,AIR}

var voxel_terrain
var bullet_mode = BULLET_MODE.AIR

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RigidBody_body_entered(body):
	if not body is VoxelTerrain:
		return
	match bullet_mode:
		BULLET_MODE.DIRT:
			var vt = voxel_terrain.get_voxel_tool()
			vt.do_sphere(global_transform.origin,5)
		BULLET_MODE.AIR:
			var vt = voxel_terrain.get_voxel_tool()
			vt.set_mode(vt.MODE_REMOVE)
			vt.do_sphere(global_transform.origin,5)
	queue_free()
