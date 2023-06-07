tool
class_name LPCAnimationResource
extends Animation

func get_resource(anim : String, dir : String) -> LPCAnimationResource:
	self.set_length(0.0) # how long is our total animation

	var track_index_anim = self.add_track(Animation.TYPE_VALUE)
	self.track_set_path(track_index_anim, ".:anim")
	self.track_insert_key(track_index_anim, 0.0, anim)
	self.value_track_set_update_mode(track_index_anim, Animation.UPDATE_DISCRETE)
	
	var track_index_dir = self.add_track(Animation.TYPE_VALUE)
	self.track_set_path(track_index_dir, ".:dir")
	self.track_insert_key(track_index_dir, 0.0, dir)
	self.value_track_set_update_mode(track_index_dir, Animation.UPDATE_DISCRETE)
#
	return self # returns the animation
