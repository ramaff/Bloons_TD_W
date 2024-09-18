/// @description Insert description here
// You can write your code in this editor

scr_setup_global_vars()

global.money = 650
global.lives = 200

global.round = 1;
global.bloon_sends = scr_import_json("autumn_acres_rounds.json", json_parse);

instance_create_depth(x, y, depth, obj_tower_control)

// Loop through the bloon sends for the most powerful bloon (if a specific bloon isn't specified)
// If round_icon is set, then use that as the sprite
// Otherwise just use the default sprite value for that bloon class
round_icons = [
	{
		"sprite": "spr_bloon",
		"index": 0
	},
	{
		"sprite": "spr_bloon",
		"index": 1
	},
	{
		"sprite": "spr_bloon",
		"index": 2
	},
	{
		"sprite": "spr_bloon",
		"index": 3
	},
	{
		"sprite": "spr_bloon",
		"index": 4
	},
	{
		"sprite": "spr_bloon",
		"index": 5
	},
	{
		"sprite": "spr_bloon",
		"index": 6
	},
	{
		"sprite": "spr_bloon",
		"index": 0
	},
	{
		"sprite": "spr_bloon",
		"index": 1
	},
	{
		"sprite": "spr_bloon",
		"index": 2
	},
	{
		"sprite": "spr_bloon",
		"index": 3
	},
	{
		"sprite": "spr_bloon",
		"index": 4
	},
	{
		"sprite": "spr_bloon",
		"index": 5
	},
	{
		"sprite": "spr_big_bully_bloon",
		"index": 0
	}
]
global.round_time = 0
global.round_gap = 360;
