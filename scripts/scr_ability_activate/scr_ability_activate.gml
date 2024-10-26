// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_activate(){

	var _abilities = variable_struct_get_names(tower_stats.abilities);
	for (var _i = 0; _i < array_length(_abilities); _i++) {
		var _ability = variable_struct_get(tower_stats.abilities, _abilities[_i])
		if variable_struct_exists(_ability, "ability_script") {
			script_execute(_ability.ability_script)
		}
		if _ability.charges >= 1 {
			_ability.charges--;
		} else {
			_ability.charge -= _ability.charge_time
		}
	}
	

}