/// @description Insert description here
// You can write your code in this editor

var _ghosts = struct_get_names(ghosts)
var _ghost_count = array_length(_ghosts)

for(var _i = 0; _i < _ghost_count; _i++) {
	var _ghost = variable_struct_get(ghosts, _ghosts[_i])
	if !instance_exists(_ghost) {
		continue	
	}
	with(_ghost) {
		instance_destroy()
	}
}




