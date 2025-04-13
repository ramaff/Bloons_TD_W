// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_play_sound(_snd = snd_pop){

	audio_sound_gain(_snd, global.game_sound_level, 0)
	audio_play_sound(_snd, 10, false);

}