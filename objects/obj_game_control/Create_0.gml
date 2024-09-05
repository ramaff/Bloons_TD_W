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
	]
]
global.round_time = 0
global.round_gap = 360;
