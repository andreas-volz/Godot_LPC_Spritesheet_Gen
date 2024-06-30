@tool
class_name LPCAnimationNodeBlendSpace2D
extends AnimationNodeBlendSpace2D

func get_resource(root_node: AnimationRootNode) -> LPCAnimationNodeBlendSpace2D:
	return self

func create_animation_blend_point(anim : String, dir : String, blend_pos: Vector2):
	var animation_node := AnimationNodeAnimation.new()
	animation_node.set_animation("LPC/" + anim + "_" + dir)
	add_blend_point(animation_node, blend_pos)

