/// @description Insert description here
// You can write your code in this editor

global.money = 650
global.lives = 200

global.round = 1;
global.bloon_sends = [
	[
		{
			"class": "normal",
			"layer": "red",
			"count": 10,
			"spread": 45,
			"cooldown": 0
		}
	],
	[
		{
			"class": "normal",
			"layer": "red",
			"count": 18,
			"spread": 30,
			"cooldown": 0
		}
	],
	[
		{
			"class": "normal",
			"layer": "blue",
			"count": 8,
			"spread": 54,
			"cooldown": 0
		},
		{
			"class": "normal",
			"layer": "red",
			"count": 10,
			"spread": 18,
			"cooldown": 540
		}
	],
	[
		{
			"class": "normal",
			"layer": "blue",
			"count": 12,
			"spread": 45,
			"cooldown": 0
		},
		{
			"class": "splitter",
			"layer": "orange",
			"count": 8,
			"spread": 60,
			"cooldown": 640
		}
	],
	[
		{
			"class": "normal",
			"layer": "rainbow",
			"count": 1,
			"spread": 45,
			"cooldown": 0
		}
	],
	[
		{
			"class": "normal",
			"layer": "green",
			"count": 10,
			"spread": 54,
			"cooldown": 0
		},
		{
			"class": "normal",
			"layer": "blue",
			"count": 20,
			"spread": 30,
			"cooldown": 540
		}
	],
	[
		{
			"class": "normal",
			"layer": "red",
			"count": 75,
			"spread": 15,
			"cooldown": 0
		},
		{
			"class": "splitter",
			"layer": "orange",
			"count": 12,
			"spread": 90,
			"cooldown": 300
		}
	],
	[
		{
			"class": "normal",
			"layer": "yellow",
			"count": 5,
			"spread": 60,
			"cooldown": 0
		},
		{
			"class": "normal",
			"layer": "blue",
			"count": 30,
			"spread": 20,
			"cooldown": 350
		}
	],
	[
		{
			"class": "normal",
			"layer": "pink",
			"count": 5,
			"spread": 60,
			"cooldown": 0
		},
		{
			"class": "normal",
			"layer": "green",
			"count": 30,
			"spread": 20,
			"cooldown": 360
		}
	],
	[
		{
			"class": "normal",
			"layer": "rainbow",
			"count": 3,
			"spread": 60,
			"cooldown": 0
		}
	],
	[
		{
			"class": "normal",
			"layer": "blue",
			"count": 75,
			"spread": 18,
			"cooldown": 0
		},
		{
			"class": "splitter",
			"layer": "cyan",
			"count": 12,
			"spread": 99,
			"cooldown": 300
		}
	],
	[
		{
			"class": "normal",
			"layer": "yellow",
			"count": 20,
			"spread": 30,
			"cooldown": 0
		},
		{
			"class": "splitter",
			"layer": "lime",
			"count": 10,
			"spread": 60,
			"cooldown": 600
		}
	],
	[
		{
			"class": "normal",
			"layer": "pink",
			"count": 15,
			"spread": 36,
			"cooldown": 0
		},
		{
			"class": "splitter",
			"layer": "amber",
			"count": 8,
			"spread": 66,
			"cooldown": 480
		}
	],
	[
		{
			"class": "normal",
			"layer": "rainbow",
			"count": 5,
			"spread": 75,
			"cooldown": 0
		},
		{
			"class": "splitter",
			"layer": "purple",
			"count": 8,
			"spread": 75,
			"cooldown": 500
		}
	],
	[
		{
			"class": "bully",
			"layer": "bully",
			"count": 1,
			"spread": 30,
			"cooldown": 0
		}
	],
]
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
