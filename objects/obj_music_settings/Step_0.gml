/// @description Insert description here
// You can write your code in this editor

if global.game_music_level != fill_amount {
	global.game_music_level = fill_amount
	with(obj_music_control) {
		event_perform(ev_other, ev_room_start)	
	}
}



