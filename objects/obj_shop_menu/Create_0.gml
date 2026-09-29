var _goodies = []
if global.menu = MENU.shop_1 {
	_goodies = [
		"road_spikes",
		"exploding_pineapple",
		"supply_drop",
		"golden_bloon_jar"
	]
}

var _i;

for(_i = 0; _i < array_length(_goodies); _i++) {
	with instance_create_depth(100, 70 + 104 * _i, depth, obj_shop_unlock_button) {
		goodie_key = _goodies[_i]
		goodie_cost = variable_struct_get(global.goodie_stats, _goodies[_i]).price
	}
}