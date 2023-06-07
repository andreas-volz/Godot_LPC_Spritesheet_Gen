tool
class_name LPCAnimationNodeBlendSpace2D
extends AnimationNodeBlendSpace2D

func get_resource(root_node: AnimationRootNode) -> LPCAnimationNodeBlendSpace2D:
	#self.add_blend_point(root_node, Vector2(1,1))
	
	return self

func create_animation_blend_point(anim : String, dir : String, blend_pos: Vector2):
	var animation_node := AnimationNodeAnimation.new()
	animation_node.set_animation(anim + "_" + dir)
	add_blend_point(animation_node, blend_pos)

