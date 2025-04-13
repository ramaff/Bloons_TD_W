/// @description Insert description here
// You can write your code in this editor

fill_amount = 1;

with instance_create_depth(x + 96, y, depth - 1, obj_settings_down_ticker) {
	setting_parent = other.id;
}
with instance_create_depth(x + 288, y, depth - 1, obj_settings_up_ticker) {
	setting_parent = other.id;
}



