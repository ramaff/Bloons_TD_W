/// @description Insert description here
// You can write your code in this editor

scr_setup_global_vars()

global.money = 5650
global.lives = 200

global.round = 0;
global.bloon_sends = scr_import_json("training_tent_rounds.json", json_parse);


instance_create_depth(x, y, depth, obj_tower_control)

// Loop through the bloon sends for the most powerful bloon (if a specific bloon isn't specified)
// If round_icon is set, then use that as the sprite
// Otherwise just use the default sprite value for that bloon class
round_properties = [
]

for(var _i = 0; _i < array_length(global.bloon_sends); _i++) {
	round_properties[_i] = {
		"sprite": "spr_bloon",
		"index": 0
	}
	
	var _group = global.bloon_sends[_i];
	var _bloon_sends_end_time = 30;
	for(var _j = 0; _j < array_length(_group); _j++) {
		_group[_j].round = _i + 1;
		_bloon_sends_end_time = max(_group[_j].cooldown + (_group[_j].count * _group[_j].spread), _bloon_sends_end_time);
	}
	variable_struct_set(round_properties[_i], "sends_end_time",_bloon_sends_end_time + 30);
}

global.round_time = 0
global.round_gap = 360;
