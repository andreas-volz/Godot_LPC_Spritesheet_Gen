@tool
class_name LPCAnimationPlayer
extends AnimationPlayer

func _ready() -> void:
	if not get_animation_library("LPC"):
		var anim_lib = AnimationLibrary.new()
		add_animation_library("LPC", anim_lib)

func create_animation_resource(anim, dir):
	var animation = LPCAnimationResource.new()
	var animation_library = self.get_animation_library("LPC")
	
	animation = animation.get_resource(anim, dir)
	
	var animation_name = anim + "_" + dir
	animation_library.add_animation(animation_name, animation)
	
	return animation
