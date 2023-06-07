tool
class_name LPCAnimationTree
extends AnimationTree

var _count = 0

func _init() -> void:
	create_animation_tree()
	anim_player = "../LPCAnimationPlayer"
	active = true
	
func create_animation_tree() -> void:
	tree_root = AnimationNodeStateMachine.new()
	
func create_animation_blend2d(animation_name : String) -> LPCAnimationNodeBlendSpace2D:
	var blend2d_node := LPCAnimationNodeBlendSpace2D.new()
	blend2d_node.blend_mode = AnimationNodeBlendSpace2D.BLEND_MODE_DISCRETE
	
	var animation_statemachine: AnimationNodeStateMachine = tree_root
	
	## this is only for AnimationTree visibility
	var x = 0
	var y = _count * 50
	if _count > 0:
		x = 200
		
	animation_statemachine.add_node(animation_name, blend2d_node, Vector2(x, y))
	
	_count += 1
	
	return blend2d_node
	
func create_animation_transition(initial_animation_name : String, animation_name : String) -> void:
	var animation_transition = AnimationNodeStateMachineTransition.new()
	var animation_transition_back = AnimationNodeStateMachineTransition.new()
	var animation_statemachine: AnimationNodeStateMachine = tree_root
	
	animation_statemachine.add_transition(initial_animation_name, animation_name, animation_transition)
	animation_statemachine.add_transition(animation_name, initial_animation_name , animation_transition_back)
	
func travel(to_node: String):
	var _animation_state = get("parameters/playback")
	_animation_state.travel(to_node)
