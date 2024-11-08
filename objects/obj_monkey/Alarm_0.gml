/// @description Insert description here
// You can write your code in this editor

alarm[0] = 30;

if stun > 0 {
	exit;
}

if variable_struct_exists(tower_stats, "abilities") {
	var _abilities = variable_struct_get_names(tower_stats.abilities);
	for (var _i = 0; _i < array_length(_abilities); _i++) {
		var _ability = variable_struct_get(tower_stats.abilities, _abilities[_i])
	
		if _ability.charges >= _ability.max_charges {
			continue;	
		}
		_ability.charge++;
		if _ability.charge >= _ability.charge_time {
			if _ability.charges <= _ability.max_charges - 1 {
				_ability.charge -= _ability.charge_time
				_ability.charges++;
			}
		}
	}
}
