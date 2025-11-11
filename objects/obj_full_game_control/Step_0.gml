/// @description Insert description here
// You can write your code in this editor

global.full_game_time++;

if instance_exists(obj_fast_forward_button) {
	if obj_fast_forward_button.fast_forward == true {
		global.full_game_time -= 0.5;	
	}
}