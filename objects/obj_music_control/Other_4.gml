/// @description Insert description here
// You can write your code in this editor

var _song = snd_letter_from_tim;

if room = rm_game_start {
	_song = snd_letter_from_tim
}
if room = rm_world_1_map || room = rm_world_1_5_map || room = rm_world_2_map || room = rm_world_2_5_map {
	_song = snd_world_map
}
if room = rm_world_3_map {
	_song = snd_world_map_2
}
if room = rm_training_room {
	_song = snd_training_room
}
if room = rm_bloon_academia || room = rm_tower_defense {
	_song = snd_bloon_academia
}
if room = rm_autumn_acres {
	_song = snd_autumn_acres
}
if room = rm_graveyard {
	_song = snd_graveyard
}
if room = rm_parade {
	_song = snd_parade
}
if room = rm_the_bridge {
	_song = snd_the_bridge
}
if room = rm_the_forest {
	_song = snd_the_forest
}
if room = rm_the_stronghold {
	_song = snd_stronghold
}
if room = rm_desert_road {
	_song = snd_desert_road
}
if room = rm_traffic_jam {
	_song = snd_traffic_jam
}
if room = rm_wall_street {
	_song = snd_wall_street
}
if room = rm_the_high_court {
	_song = snd_the_high_court
}

audio_sound_gain(_song, global.game_music_level, 0)
if !audio_is_playing(_song) {
	audio_stop_all()
	audio_play_sound(_song, 1000, true);
}

