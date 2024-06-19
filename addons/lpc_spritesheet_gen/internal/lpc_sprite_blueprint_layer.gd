## Copyright (C) 2023 Denis Selensky - All Rights Reserved
## You may use, distribute and modify this code under the terms of the MIT license

@tool
extends Resource
class_name LPCSpriteBlueprintLayer

@export var zorder: int = 10
@export var body: String = "male"     # Type of Body
@export var name: String = "Template" # From JSON Data
@export var type_name: String = "body" # From JSON Data
@export var oversize_animation: String = "" # TODO this was null before -> check
@export var variant: String = "0" # From Selection
@export var abs_path: String = ""
@export var rel_path: String = ""
@export var texture: Texture : get=get_texture
@export var material: Material = preload("../lpc_layers_material_shader.tres") : set=_set_material

func _set_material(new_material : Material):
	material = new_material
	emit_changed()

func load_texture() -> bool:
	var resource_exists = ResourceLoader.exists(abs_path)
	if resource_exists and not texture:
		print("explicit loading from " + abs_path)
		texture = load(abs_path)
		emit_changed()
	return resource_exists

func get_texture():
	if !texture:
		load_texture()
	return texture
	
func _init():
	if abs_path != "":
		print("_init loading from " + abs_path)
		texture = load(abs_path)
