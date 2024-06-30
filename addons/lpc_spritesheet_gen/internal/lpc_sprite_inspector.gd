## Copyright (C) 2023 Denis Selensky - All Rights Reserved
## You may use, distribute and modify this code under the terms of the MIT license

@tool
extends EditorInspectorPlugin

var DockScene = preload("inspector_plugin_dock.tscn")
var json_files = null

func _can_handle(object : Object):
	if(object as LPCSpriteBlueprint):
		return true
	else:
		return false

func _parse_begin(object):
	if (object as LPCSpriteBlueprint):
		var dockinstance = DockScene.instantiate()
		dockinstance.set_blueprint(object)
		add_custom_control(dockinstance)
		

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	#if path == "layers":
	#	return true
	return false
