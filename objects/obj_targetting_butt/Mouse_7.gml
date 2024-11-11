/// @description Insert description here
// You can write your code in this editor

if !instance_exists(selected_monkey) {
	instance_destroy()
	exit;
}

selected_monkey.targeting = variable_struct_get(targeting_options_order, selected_monkey.targeting)

