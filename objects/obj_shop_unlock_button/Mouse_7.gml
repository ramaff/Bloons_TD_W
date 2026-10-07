

if global.monkey_money >= goodie_cost {

	var _tower = variable_struct_get(global.towers_progress, goodie_key)
	variable_struct_set(_tower, "unlocked", true)
	scr_calc_monkey_money()
}