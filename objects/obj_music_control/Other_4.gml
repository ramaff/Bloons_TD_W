/// @description Insert description here
// You can write your code in this editor

if room = rm_game_start {
	audio_stop_all()

	audio_play_sound(snd_letter_from_tim, 1000, true);
}
if room = rm_world_1_map || room = rm_world_1_5_map || room = rm_world_2_map {
	if !audio_is_playing(snd_world_map) {
		audio_stop_all()
		audio_play_sound(snd_world_map, 1000, true);
	}
}
if room = rm_training_room {
	audio_stop_all()
	audio_play_sound(snd_training_room, 1000, true);
}
if room = rm_bloon_academia || room = rm_tower_defense {
	audio_stop_all()
	audio_play_sound(snd_bloon_academia, 1000, true);
}
if room = rm_autumn_acres {
	audio_stop_all()
	audio_play_sound(snd_autumn_acres, 1000, true);
}
if room = rm_graveyard {
	audio_stop_all()
	audio_play_sound(snd_graveyard, 1000, true);
}
if room = rm_parade {
	audio_stop_all()
	audio_play_sound(snd_parade, 1000, true);
}
if room = rm_the_bridge {
	audio_stop_all()
	audio_play_sound(snd_the_bridge, 1000, true);
}
if room = rm_the_forest {
	audio_stop_all()
	audio_play_sound(snd_the_forest, 1000, true);
}
if room = rm_the_stronghold {
	audio_stop_all()
	audio_play_sound(snd_stronghold, 1000, true);
}


