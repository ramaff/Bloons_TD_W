/// @description Insert description here
// You can write your code in this editor

var _track = room_get_name(track);

var _tracks_info = {
	"rm_training_tent": {
		"paths": [pth_training_tent],
		"round_data": "training_tent_rounds.json"
	},
	"rm_bloon_academia": {
		"paths": [pth_bloon_academia],
		"round_data": "bloon_academia_rounds.json"
	}
}

var _track_info = variable_struct_get(_tracks_info, _track);

global.paths = _track_info.paths
global.round_data = _track_info.round_data

room_goto(track)




