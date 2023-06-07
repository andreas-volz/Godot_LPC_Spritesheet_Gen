tool
class_name LPCAnimationPlayer
extends AnimationPlayer

func create_animation_resource(anim, dir):
	var animation = LPCAnimationResource.new()
	animation = animation.get_resource(anim, dir)
	
	var animation_name = anim + "_" + dir
	self.add_animation(animation_name, animation)
	
	return animation
