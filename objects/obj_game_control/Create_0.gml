/// @description Insert description here
// You can write your code in this editor

global.money = 650
global.lives = 200

global.round = 1;
global.bloon_sends = [
	[
		{
			"class": "normal",
			"layers": 1,
			"count": 10,
			"spread": 75,
			"cooldown": 0
		}
	],
	[
		{
			"class": "normal",
			"layers": 1,
			"count": 15,
			"spread": 56,
			"cooldown": 0
		}
	],
	[
		{
			"class": "normal",
			"layers": 2,
			"count": 8,
			"spread": 80,
			"cooldown": 0
		},
		{
			"class": "normal",
			"layers": 1,
			"count": 8,
			"spread": 30,
			"cooldown": 750
		}
	]
]
global.round_time = 0
global.round_gap = 360;
