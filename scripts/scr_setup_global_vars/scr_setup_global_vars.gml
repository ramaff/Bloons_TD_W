// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_global_vars(){

	global.bloon_stats = {
		"normal": {
			"red": {
				layers: 1,
				index: 0,
				rbe: 1,
				health: 1,
				density: 1,
				speed: 1.5
			},
			"blue": {
				layers: 2,
				index: 1,
				rbe: 2,
				health: 1,
				density: 1,
				speed: 2,
				children: [
					{
						"class": "normal",
						"layer": "red"
					}
				]
			},
			"green": {
				layers: 3,
				index: 2,
				rbe: 3,
				health: 1,
				density: 1,
				speed: 2.5,
				children: [
					{
						"class": "normal",
						"layer": "blue"
					}
				]
			},
			"yellow": {
				layers: 4,
				index: 3,
				rbe: 4,
				health: 1,
				density: 1,
				speed: 4.5,
				children: [
					{
						"class": "normal",
						"layer": "green"
					}
				]
			},
			"pink": {
				layers: 5,
				index: 4,
				rbe: 5,
				health: 1,
				density: 1,
				speed: 5,
				children: [
					{
						"class": "normal",
						"layer": "yellow"
					}
				]
			},
			"black": {
				layers: 6,
				index: 5,
				rbe: 11,
				health: 1,
				density: 1,
				speed: 2,
				children: [
					{
						"class": "normal",
						"layer": "pink"
					},
					{
						"class": "normal",
						"layer": "pink"
					}
				]
			},
			"white": {
				layers: 6,
				index: 6,
				rbe: 11,
				health: 1,
				density: 1,
				speed: 2.25,
				children: [
					{
						"class": "normal",
						"layer": "pink"
					},
					{
						"class": "normal",
						"layer": "pink"
					}
				]
			},
			"zebra": {
				layers: 7,
				index: 7,
				rbe: 23,
				health: 1,
				density: 1,
				speed: 2.5,
				children: [
					{
						"class": "normal",
						"layer": "black"
					},
					{
						"class": "normal",
						"layer": "white"
					}
				]
			},
			"rainbow": {
				layers: 8,
				index: 8,
				rbe: 47,
				health: 1,
				density: 1,
				speed: 4.25,
				children: [
					{
						"class": "normal",
						"layer": "zebra"
					},
					{
						"class": "normal",
						"layer": "zebra"
					}
				]
			}
		},
		"splitter": {
			"orange": {
				layers: 2,
				index: 0,
				rbe: 4,
				power_lvl: 3,
				health: 1,
				density: 1,
				speed: 1.8,
				children: [
					{
						"class": "normal",
						"layer": "red"
					},
					{
						"class": "normal",
						"layer": "red"
					},
					{
						"class": "normal",
						"layer": "red"
					}
				]
			},
			"cyan": {
				layers: 3,
				index: 1,
				rbe: 7,
				power_lvl: 5,
				health: 1,
				density: 1,
				speed: 2.3,
				children: [
					{
						"class": "normal",
						"layer": "blue"
					},
					{
						"class": "normal",
						"layer": "blue"
					},
					{
						"class": "normal",
						"layer": "blue"
					}
				]
			},
			"lime": {
				layers: 4,
				index: 2,
				health: 1,
				density: 1,
				speed: 2.8,
				children: [
					{
						"class": "normal",
						"layer": "green"
					},
					{
						"class": "normal",
						"layer": "green"
					},
					{
						"class": "normal",
						"layer": "green"
					}
				]
			},
			"amber": {
				layers: 5,
				index: 3,
				health: 1,
				density: 1,
				speed: 4.8,
				children: [
					{
						"class": "normal",
						"layer": "yellow"
					},
					{
						"class": "normal",
						"layer": "yellow"
					},
					{
						"class": "normal",
						"layer": "yellow"
					}
				]
			},
			"purple": {
				layers: 6,
				index: 4,
				health: 1,
				density: 1,
				speed: 5.3,
				children: [
					{
						"class": "normal",
						"layer": "pink"
					},
					{
						"class": "normal",
						"layer": "pink"
					},
					{
						"class": "normal",
						"layer": "pink"
					}
				]
			},
		},
		"moab": [
			{
				layers: 1,
				health: 200,
				density: 1,
				speed: 2.1,
			}
		],
		"bully": {
			"object": "obj_bully",
			"bully": {
				layers: 1,
				health: 500,
				density: 1,
				speed: 1,
			}
		}
		
		
	}

}