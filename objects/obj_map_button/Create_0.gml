/// @description Insert description here
// You can write your code in this editor

track = rm_training_room
tracks_info = {
	"rm_training_room": {
		"paths": [pth_training_room],
		"track_sprite": "spr_training_room_track",
		"name": "training room",
		"round_data": "training_room_rounds.json"
	},
	"rm_bloon_academia": {
		"paths": [pth_bloon_academia],
		"round_data": "bloon_academia_rounds.json",
		"name": "bloon academia",
		"requirement": "training_room",
	},
	"rm_autumn_acres": {
		"paths": [pth_autumn_acres],
		"round_data": "autumn_acres_rounds.json",
		"name": "autumn acres",
		"requirement": "bloon_academia"
	},
	"rm_graveyard": {
		"paths": [pth_graveyard_1, pth_graveyard_2, pth_graveyard_3, pth_graveyard_4, pth_graveyard_5, pth_graveyard_6],
		"round_data": "graveyard_rounds.json",
		"name": "graveyard",
		"requirement": "autumn_acres"
	},
	"rm_parade": {
		"paths": [pth_parade_1, pth_parade_2],
		"round_data": "parade_rounds.json",
		"name": "parade",
		"requirement": "autumn_acres"
	},
	"rm_the_bridge": {
		"paths": [pth_the_bridge_1, pth_the_bridge_2],
		"round_data": "the_bridge_rounds.json",
		"name": "the bridge",
		"requirement": "parade"
	},
	"rm_the_forest": {
		"paths": [pth_the_forest_1, pth_the_forest_2, pth_the_forest_3],
		"round_data": "the_forest_rounds.json",
		"name": "the forest",
		"requirement": "the_bridge"
	},
	"rm_tower_defense": {
		"paths": [pth_tower_defense],
		"round_data": "tower_defense_rounds.json",
		"name": "tower defense",
		"requirement": "the_forest"
	},
	"rm_the_stronghold": {
		"paths": [pth_the_stronghold_1, pth_the_stronghold_2],
		"round_data": "the_stronghold_rounds.json",
		"name": "the stronghold",
		"requirement": "tower_defense"
	},
	"rm_desert_road": {
		"paths": [pth_desert_road_1, pth_desert_road_2],
		"round_data": "desert_road_rounds.json",
		"name": "desert road",
		"requirement": "the_stronghold"
	}
}
global.mission = "training_room"




