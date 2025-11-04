/// @description Insert description here
// You can write your code in this editor

var _i = 0;
var _picked_i = irandom(instance_number(obj_monkey)) + 1
var _picked_id = noone;

if instance_number(obj_monkey) <= 0 {
	exit;
}

while(_picked_id == noone) {
	with(obj_monkey) {
		if _i = global.tower_investment_index {
			if object_get_parent(object_index) = obj_turret {
				//_i++;
				global.tower_investment_index++;
				continue;	
			}
			_picked_id = id;
			break;
		}
		_i++;
	}
}

global.tower_investment_index++;

if instance_exists(_picked_id) {
	
	var _picked_tower = {
		"id": _picked_id,
		"base_tower_id": _picked_id.base_tower_id
	}
	
	array_push(tower_investments, _picked_tower)
	with(obj_wall_street_control) {
		array_push(tower_investments, _picked_tower)
	}
}
