/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_oetztype)

global.missions_complete = {
	"training_room": {
		"complete": false,
		"best_time": 999999	
	},
	"bloon_academia": {
		"complete": false,
		"best_time": 999999	
	},
	"autumn_acres": {
		"complete": false,
		"best_time": 999999	
	},
	"graveyard": {
		"complete": false,
		"best_time": 999999	
	},
	"parade": {
		"complete": false,
		"best_time": 999999	
	},
	"the_bridge": {
		"complete": false,
		"best_time": 999999	
	},
	"the_forest": {
		"complete": false,
		"best_time": 999999	
	},
	"tower_defense": {
		"complete": false,
		"best_time": 999999	
	},
	"the_stronghold": {
		"complete": false,
		"best_time": 999999	
	},
	"desert_road": {
		"complete": false,
		"best_time": 999999	
	},
	"traffic_jam": {
		"complete": false,
		"best_time": 999999	
	},
	"wall_street": {
		"complete": false,
		"best_time": 999999	
	},
	"the_high_court": {
		"complete": false,
		"best_time": 999999	
	}
}

global.towers_progress = {
	"selected": ["sling_shot_monkey", "cactus_monkey", "pineapple_monkey", "pogo_stick_monkey"],
	"sling_shot_monkey": {
		"unlocked": true	
	},
	"cactus_monkey": {
		"unlocked": true	
	},
	"pineapple_monkey": {
		"unlocked": true	
	},
	"pogo_stick_monkey": {
		"unlocked": true	
	},
	"assassin_monkey": {
		"unlocked": false	
	},
	"haunted_monkey": {
		"unlocked": false	
	},
	"goonkey": {
		"unlocked": false	
	},
	"marbles_monkey": {
		"unlocked": false	
	},
	"caster_monkey": {
		"unlocked": false	
	},
	"skateboard_monkey": {
		"unlocked": false	
	},
	"bongo_monkey": {
		"unlocked": false	
	}
}

global.heroes_progress = {
	"selected": ["jim"],
	"jim": {
		"unlocked": true
	},
	"angry_squirrel": {
		"unlocked": false	
	},
	"clown_monkey": {
		"unlocked": false	
	},
	"trickster": {
		"unlocked": false	
	}
}

global.upgrades_progress = {
	"jim": {
		"unlocked_paths": {"Split Darts": {"unlocked_upgrades": 2}}
	},
	"angry_squirrel": {
		"unlocked_paths": {"Fiery Rage": {"unlocked_upgrades": 2}}
	},
	"clown_monkey": {
		"unlocked_paths": {"Clown Moab": {"unlocked_upgrades": 2}}
	},
	"sling_shot_monkey": {
		"unlocked_paths": {"Long Shot": {"unlocked_upgrades": 2}}	
	},
	"cactus_monkey": {
		"unlocked_paths": {"Bandito": {"unlocked_upgrades": 2}}	
	},
	"pineapple_monkey": {
		"unlocked_paths": {"Pineapple Express": {"unlocked_upgrades": 2}}	
	},
	"pogo_stick_monkey": {
		"unlocked_paths": {"Jackhammer": {"unlocked_upgrades": 2}}	
	},
	"assassin_monkey": {
		"unlocked_paths": {"Multi-Strikes": {"unlocked_upgrades": 2}}	
	},
	"haunted_monkey": {
		"unlocked_paths": {"Chase Scene": {"unlocked_upgrades": 2}}	
	},
	"goonkey": {
		"unlocked_paths": {"Goo Cube": {"unlocked_upgrades": 2}}	
	},
	"marbles_monkey": {
		"unlocked_paths": {"Spinning Tops": {"unlocked_upgrades": 2}}
	},
	"caster_monkey": {
		"unlocked_paths": {"Deep Engravement": {"unlocked_upgrades": 2}}
	},
	"skateboard_monkey": {
		"unlocked_paths": {"Scooter": {"unlocked_upgrades": 2}}
	},
	"bongo_monkey": {
		"unlocked_paths": {"Spray Paint Artist": {"unlocked_upgrades": 2}}
	},
}

global.start_room = rm_world_1_map
global.full_game_time = 0;

scr_load_game()

scr_setup_global_vars()

if global.start_room = rm_game_start {
	global.start_room = rm_world_1_map	
}

