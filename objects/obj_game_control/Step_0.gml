/// @description Insert description here
// You can write your code in this editor

//if instance_number(obj_bloon) <= 0 {
	
//}

if global.lives <= 0 {
	game_end()	
}

if instance_number(obj_bloon) <= 0 and bully_count <= 0 {
	instance_create_depth(100, 100, depth - 100, obj_win_butt)	
}
