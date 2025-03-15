// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_bloon_stats(){
	return {
		"normal": {
			"sprite": "spr_bloon",
			"object": "obj_normal_bloon",
			"shielded_sprite": "spr_bloon_shielded",
			"tattered_sprite": "spr_bloon_tattered",
			"freeze_sprite": "spr_bloon_freeze",
			"goop_sprite": "spr_bloon_goop",
			max_health: 1,
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
			"sprite": "spr_splitter_bloon",
			"object": "obj_splitter_bloon",
			"shielded_sprite": "spr_splitter_shielded",
			"tattered_sprite": "spr_splitter_tattered",
			"freeze_sprite": "spr_splitter_freeze",
			max_health: 1,
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
				rbe: 10,
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
				rbe: 13,
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
				rbe: 16,
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
			"prismatic": {
				layers: 9,
				index: 5,
				rbe: 142,
				health: 1,
				density: 1,
				speed: 4.55,
				children: [
					{
						"class": "normal",
						"layer": "rainbow"
					},
					{
						"class": "normal",
						"layer": "rainbow"
					},
					{
						"class": "normal",
						"layer": "rainbow"
					}
				]
			},
		},
		"lead": {
			"properties": [
				"metallic"
			],
			"object": "obj_lead_bloon",
			"lead": {
				"sprite": "spr_lead_bloon",
				"tattered_sprite": "spr_lead_tattered",
				layers: 7,
				index: 0,
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
						"layer": "black"
					}
				]
			},
			"block": {
				"sprite": "spr_block_bloon",
				layers: 17,
				index: 0,
				rbe: 104,
				health: 10,
				max_health: 10,
				density: 1,
				speed: 1.75,
				children: [
					{
						"class": "lead",
						"layer": "lead"
					},
					{
						"class": "lead",
						"layer": "lead"
					},
					{
						"class": "lead",
						"layer": "lead"
					},
					{
						"class": "lead",
						"layer": "lead"
					}
				]
			}
		},
		"stuffed": {
			"object": "obj_bloon",
			"sprite": "spr_stuffed_bloon",
			"big_bloon_tier": 1,
			"remaining_value": 1,
			"red": {
				layers: 3,
				index: 0,
				rbe: 14,
				health: 1,
				density: 1,
				speed: 1.2,
				children: [
					{"class": "splitter", "layer": "orange", "properties": ["float to track"]},
					{"class": "splitter", "layer": "orange", "properties": ["float to track"]},
					{"class": "normal", "layer": "red", "properties": ["float to track"]},
					{"class": "normal", "layer": "red", "properties": ["float to track"]},
					{"class": "normal", "layer": "red", "properties": ["float to track"]},
					{"class": "normal", "layer": "red", "properties": ["float to track"]},
					{"class": "normal", "layer": "red", "properties": ["float to track"]}
				]
			},
			"blue": {
				layers: 4,
				index: 1,
				rbe: 25,
				health: 1,
				density: 1,
				speed: 1.4,
				children: [
					{"class": "splitter", "layer": "cyan", "properties": ["float to track"]},
					{"class": "splitter", "layer": "cyan", "properties": ["float to track"]},
					{"class": "normal", "layer": "blue", "properties": ["float to track"]},
					{"class": "normal", "layer": "blue", "properties": ["float to track"]},
					{"class": "normal", "layer": "blue", "properties": ["float to track"]},
					{"class": "normal", "layer": "blue", "properties": ["float to track"]},
					{"class": "normal", "layer": "blue", "properties": ["float to track"]}
				]
			},
			"green": {
				layers: 5,
				index: 2,
				rbe: 36,
				health: 1,
				density: 1,
				speed: 1.6,
				children: [
					{"class": "splitter", "layer": "lime", "properties": ["float to track"]},
					{"class": "splitter", "layer": "lime", "properties": ["float to track"]},
					{"class": "normal", "layer": "green", "properties": ["float to track"]},
					{"class": "normal", "layer": "green", "properties": ["float to track"]},
					{"class": "normal", "layer": "green", "properties": ["float to track"]},
					{"class": "normal", "layer": "green", "properties": ["float to track"]},
					{"class": "normal", "layer": "green", "properties": ["float to track"]}
				]
			},
			"yellow": {
				layers: 6,
				index: 3,
				rbe: 47,
				health: 1,
				density: 1,
				speed: 2.2,
				children: [
					{"class": "splitter", "layer": "amber", "properties": ["float to track"]},
					{"class": "splitter", "layer": "amber", "properties": ["float to track"]},
					{"class": "normal", "layer": "yellow", "properties": ["float to track"]},
					{"class": "normal", "layer": "yellow", "properties": ["float to track"]},
					{"class": "normal", "layer": "yellow", "properties": ["float to track"]},
					{"class": "normal", "layer": "yellow", "properties": ["float to track"]},
					{"class": "normal", "layer": "yellow", "properties": ["float to track"]}
				]
			},
			"pink": {
				layers: 7,
				index: 4,
				rbe: 58,
				health: 1,
				density: 1,
				speed: 2.4,
				children: [
					{"class": "splitter", "layer": "purple", "properties": ["float to track"]},
					{"class": "splitter", "layer": "purple", "properties": ["float to track"]},
					{"class": "normal", "layer": "pink", "properties": ["float to track"]},
					{"class": "normal", "layer": "pink", "properties": ["float to track"]},
					{"class": "normal", "layer": "pink", "properties": ["float to track"]},
					{"class": "normal", "layer": "pink", "properties": ["float to track"]},
					{"class": "normal", "layer": "pink", "properties": ["float to track"]}
				]
			}
		},
		"deflation": {
			"object": "obj_deflation_bloon",
			"sprite": "spr_big_deflation_bloon",
			"big_bloon_tier": 1,
			"height": 5,
			"red": {
				layers: 5,
				index: 0,
				rbe: 7,
				health: 3,
				max_health: 3,
				density: 1,
				speed: 3.3,
				children: [
					{
						"class": "splitter",
						"layer": "orange",
						"properties": [
							"tattered", "float to track"
						]
					}
				]
			},
			"blue": {
				layers: 9,
				index: 1,
				rbe: 13,
				health: 6,
				max_health: 6,
				density: 1,
				speed: 4.4,
				children: [
					{
						"class": "splitter",
						"layer": "cyan",
						"properties": [
							"tattered", "float to track"
						]
					}
				]
			},
			"green": {
				layers: 13,
				index: 2,
				rbe: 19,
				health: 9,
				density: 1,
				speed: 5.5,
				children: [
					{
						"class": "splitter",
						"layer": "lime",
						"properties": [
							"tattered", "float to track"
						]
					}
				]
			},
			"yellow": {
				layers: 17,
				index: 3,
				rbe: 25,
				health: 12,
				density: 1,
				speed: 6.6,
				children: [
					{
						"class": "splitter",
						"layer": "amber",
						"properties": [
							"tattered", "float to track"
						]
					}
				]
			},
			"pink": {
				layers: 17,
				index: 4,
				rbe: 31,
				health: 15,
				density: 1,
				speed: 7.7,
				children: [
					{
						"class": "splitter",
						"layer": "purple",
						"properties": [
							"tattered", "float to track"
						]
					}
				]
			},
			"rainbow": {
				layers: 54,
				index: 5,
				rbe: 187,
				health: 45,
				density: 1,
				speed: 6.3,
				children: [
					{
						"class": "splitter",
						"layer": "prismatic",
						"properties": [
							"tattered", "float to track"
						]
					}
				]
			}
		},
		"nurse": {
			"object": "obj_nurse_bloon",
			"sprite": "spr_nurse_bloon",
			"big_bloon_tier": 1,
			"red": {
				layers: 12,
				index: 0,
				rbe: 13,
				health: 9,
				density: 1,
				speed: 1.2,
				children: [
					{
						"class": "splitter",
						"layer": "orange",
						"properties": [
							"regrow"
						]
					}
				]
			},
			"blue": {
				layers: 21,
				index: 1,
				rbe: 25,
				health: 18,
				density: 1,
				speed: 1.5,
				children: [
					{
						"class": "splitter",
						"layer": "cyan",
						"properties": [
							"regrow"
						]
					}
				]
			},
			"green": {
				layers: 31,
				index: 2,
				rbe: 37,
				health: 27,
				density: 1,
				speed: 1.8,
				children: [
					{
						"class": "splitter",
						"layer": "lime",
						"properties": [
							"regrow"
						]
					}
				]
			},
			"yellow": {
				layers: 41,
				index: 3,
				rbe: 49,
				health: 36,
				density: 1,
				speed: 2.7,
				children: [
					{
						"class": "splitter",
						"layer": "amber",
						"properties": [
							"regrow"
						]
					}
				]
			},
			"pink": {
				layers: 51,
				index: 4,
				rbe: 61,
				health: 45,
				density: 1,
				speed: 3,
				children: [
					{
						"class": "splitter",
						"layer": "purple",
						"properties": [
							"regrow"
						]
					}
				]
			},
			"rainbow": {
				layers: 99,
				index: 4,
				rbe: 232,
				health: 90,
				density: 1,
				speed: 2.4,
				children: [
					{
						"class": "splitter",
						"layer": "prismatic",
						"properties": [
							"regrow"
						]
					}
				]
			}
		},
		"ceramic": {
			"object": "obj_ceramic_class",
			"ceramic": {
				sprite: "spr_ceramic_bloon",
				"tattered_sprite": "spr_ceramic_tattered",
				layers: 18,
				index: 0,
				rbe: 104,
				health: 10,
				max_health: 10,
				density: 1,
				speed: 3.75,
				children: [
					{
						"class": "normal",
						"layer": "rainbow"
					},
					{
						"class": "normal",
						"layer": "rainbow"
					}
				]
			},
			"brick": {
				sprite: "spr_brick_bloon",
				layers: 48,
				index: 0,
				rbe: 238,
				health: 30,
				max_health: 30,
				density: 1,
				speed: 2.5,
				children: [
					{
						"class": "ceramic",
						"layer": "ceramic"
					},
					{
						"class": "ceramic",
						"layer": "ceramic"
					}
				]
			}
		},
		"moab": {
			"object": "obj_moab_class",
			"mini": {
				sprite: "spr_mini_moab",
				"big_bloon_tier": 1,
				layers: 58,
				index: 0,
				rbe: 238,
				health: 50,
				density: 1,
				speed: 2.1,
				children: [
					{
						"class": "normal",
						"layer": "rainbow"
					},
					{
						"class": "normal",
						"layer": "rainbow"
					},
					{
						"class": "normal",
						"layer": "rainbow"
					},
					{
						"class": "normal",
						"layer": "rainbow"
					}
				]
			},
			"moab": {
				sprite: "spr_moab",
				layers: 218,
				"big_bloon_tier": 2,
				index: 0,
				rbe: 616,
				health: 200,
				density: 1,
				speed: 1.5,
				children: [
					{
						"class": "ceramic",
						"layer": "ceramic"
					},
					{
						"class": "ceramic",
						"layer": "ceramic"
					},
					{
						"class": "ceramic",
						"layer": "ceramic"
					},
					{
						"class": "ceramic",
						"layer": "ceramic"
					}
				]
			},
			"brc": {
				sprite: "spr_brc",
				layers: 558,
				"big_bloon_tier": 3,
				index: 0,
				rbe: 2404,
				health: 500,
				density: 1,
				speed: 0.75,
				children: [
					{"class": "moab","layer": "mini"},
					{"class": "moab","layer": "mini"},
					{"class": "moab","layer": "mini"},
					{"class": "moab","layer": "mini"},
					{"class": "moab","layer": "mini"},
					{"class": "moab","layer": "mini"},
					{"class": "moab","layer": "mini"},
					{"class": "moab","layer": "mini"}
				]
			},
			"bfb": {
				sprite: "spr_bfb",
				layers: 918,
				"big_bloon_tier": 4,
				index: 0,
				rbe: 3164,
				health: 700,
				density: 1,
				speed: 0.85,
				children: [
					{"class": "moab","layer": "moab"},
					{"class": "moab","layer": "moab"},
					{"class": "moab","layer": "moab"},
					{"class": "moab","layer": "moab"},
				]
			}
		},
		"bully": {
			"object": "obj_bully",
			"bully": {
				sprite: "spr_bully_bloon",
				"big_bloon_tier": 2,
				layers: 500,
				rbe: 500,
				damage: 5,
				health: 500,
				density: 1,
				speed: 1,
			},
			"nerd": {
				sprite: "spr_nerd_bloon",
				"big_bloon_tier": 1,
				layers: 250,
				rbe: 438,
				damage: 5,
				health: 250,
				density: 1,
				speed: 1.5,
				children: [
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							 "float to track"
						]
					},
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							 "float to track"
						]
					},
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							 "float to track"
						]
					},
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							 "float to track"
						]
					}
				]
			},
			"red bully": {
				sprite: "spr_red_bully",
				"big_bloon_tier": 2,
				layers: 500,
				rbe: 500,
				damage: 2,
				health: 500,
				density: 1,
				speed: 1,
			},
			"blue bully": {
				sprite: "spr_blue_bully",
				"big_bloon_tier": 3,
				layers: 1000,
				rbe: 1000,
				health: 1000,
				damage: 4,
				density: 1,
				speed: 1.2,
			},
			"green bully": {
				sprite: "spr_green_bully",
				"big_bloon_tier": 4,
				layers: 1500,
				rbe: 1500,
				health: 1500,
				damage: 6,
				density: 1,
				speed: 1.4,
			},
			"yellow bully": {
				sprite: "spr_yellow_bully",
				"big_bloon_tier": 4,
				layers: 2000,
				rbe: 2000,
				health: 2000,
				damage: 8,
				density: 1,
				speed: 2,
			},
			"big bully": {
				sprite: "spr_big_bully_bloon",
				"big_bloon_tier": 5,
				object: "obj_big_bully_bloon",
				layers: 5000,
				rbe: 5000,
				health: 5000,
				damage: 10,
				density: 1,
				speed: 1.35,
			}
		},
		"peek-a-bloon": {
			"sprite": "spr_peek_a_bloon",
			"object": "obj_peek_a_bloon",
			"height": 5,
			"red": {
				layers: 2,
				index: 0,
				rbe: 2,
				health: 1,
				density: 1,
				speed: 0.75,
				children: [
					{
						"class": "normal",
						"layer": "red",
						"properties": [
							"tattered"
						]
					}
				]
			},
			"blue": {
				layers: 3,
				index: 1,
				rbe: 5,
				health: 1,
				density: 1,
				speed: 1,
				children: [
					{
						"class": "peek-a-bloon",
						"layer": "red"
					},
					{
						"class": "normal",
						"layer": "blue",
						"properties": [
							"tattered"
						]
					}
				]
			},
			"green": {
				layers: 4,
				index: 2,
				rbe: 9,
				health: 1,
				density: 1,
				speed: 1.25,
				children: [
					{
						"class": "peek-a-bloon",
						"layer": "blue"
					},
					{
						"class": "normal",
						"layer": "green",
						"properties": [
							"tattered"
						]
					}
				]
			},
			"yellow": {
				layers: 5,
				index: 3,
				rbe: 14,
				health: 1,
				density: 1,
				speed: 2.25,
				children: [
					{
						"class": "peek-a-bloon",
						"layer": "green"
					},
					{
						"class": "normal",
						"layer": "yellow",
						"properties": [
							"tattered"
						]
					}
				]
			},
			"pink": {
				layers: 6,
				index: 4,
				rbe: 20,
				health: 1,
				density: 1,
				speed: 2.5,
				children: [
					{
						"class": "peek-a-bloon",
						"layer": "yellow"
					},
					{
						"class": "normal",
						"layer": "pink",
						"properties": [
							"tattered"
						]
					}
				]
			},
			"rainbow": {
				layers: 9,
				index: 5,
				rbe: 128,
				health: 1,
				density: 1,
				speed: 2,
				children: [
					{
						"class": "peek-a-bloon",
						"layer": "pink"
					},
					{
						"class": "peek-a-bloon",
						"layer": "pink"
					},
					{
						"class": "peek-a-bloon",
						"layer": "pink"
					},
					{
						"class": "peek-a-bloon",
						"layer": "pink"
					},
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							"tattered"
						]
					}
				]
			}
		},
		"tack_the_ripper": {
			"object": "obj_tack_the_ripper",
			"red": {
				sprite: "spr_tack_the_ripper",
				layers: 1500,
				rbe: 1500,
				"big_bloon_tier": 4,
				damage: 40,
				health: 1500,
				density: 1,
				speed: 1.9,
			}
		},
		"frankensteins_bloon": {
			"object": "obj_frankensteins_bloon",
			"green": {
				sprite: "spr_frankensteins_bloon",
				"big_bloon_tier": 4,
				layers: 2700,
				rbe: 2700,
				damage: 50,
				health: 2700,
				density: 1,
				speed: 0.8,
			}
		},
		"zombie": {
			"sprite": "spr_zombie_bloon",
			"object": "obj_zombie_bloon",
			"shielded_sprite": "spr_bloon_shielded",
			"tattered_sprite": "spr_bloon_tattered",
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
						"class": "zombie",
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
						"class": "zombie",
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
						"class": "zombie",
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
						"class": "zombie",
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
						"class": "zombie",
						"layer": "pink"
					},
					{
						"class": "zombie",
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
						"class": "zombie",
						"layer": "pink"
					},
					{
						"class": "zombie",
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
						"class": "zombie",
						"layer": "black"
					},
					{
						"class": "zombie",
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
						"class": "zombie",
						"layer": "zebra"
					},
					{
						"class": "zombie",
						"layer": "zebra"
					}
				]
			}
		},
		"hot_air": {
			"object": "obj_hot_air_bloon",
			"big_bloon_tier": 2,
			"red": {
				"sprite": "spr_hot_air_bloon",
				index: 0,
				layers: 350,
				rbe: 350,
				damage: 0,
				health: 350,
				density: 1,
				speed: 1.2,
			},
			"blue": {
				"sprite": "spr_hot_air_bloon_blue",
				index: 0,
				layers: 700,
				rbe: 700,
				damage: 0,
				health: 700,
				density: 1,
				speed: 1.4,
			},
			"green": {
				"sprite": "spr_hot_air_bloon_green",
				index: 0,
				layers: 1050,
				rbe: 1050,
				damage: 0,
				health: 1050,
				density: 1,
				speed: 1.6,
			}
		},
		"pinata": {
			"object": "obj_pinata",
			"big_bloon_tier": 1,
			"pinata": {
				"sprite": "spr_pinata",
				index: 0,
				rbe: 1388,
				layers: 200,
				health: 200,
				density: 1,
				speed: 4.1,
				children: [
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							 "float to track"
						]
					},
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							 "float to track"
						]
					},
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							 "float to track"
						]
					},
					{
						"class": "normal",
						"layer": "rainbow",
						"properties": [
							 "float to track"
						]
					}
				]
			}
		},
		"the_party_tank": {
			"object": "obj_the_party_tank",
			"big_bloon_tier": 7,
			"the_party_tank": {
				sprite: "spr_the_party_tank",
				layers: 8500,
				rbe: 8500,
				damage: 500,
				health: 8500,
				density: 1,
				speed: 0.12,
			}
		},
		"moaby_dick": {
			"object": "obj_moaby_dick",
			"big_bloon_tier": 7,
			"mini": {
				sprite: "spr_moaby_dick",
				layers: 6500,
				rbe: 6500,
				damage: 500,
				health: 8500,
				density: 1,
				speed: 0.06,
			}
		},
		"animal": {
			"sprite": "spr_bloon_animal",
			"object": "obj_normal_bloon",
			"shielded_sprite": "spr_bloon_shielded",
			"tattered_sprite": "spr_bloon_tattered",
			max_health: 1,
			"red": {
				layers: 1,
				index: 0,
				rbe: 1,
				health: 1,
				density: 1,
				speed: 1.5,
				children: [
					{"class": "normal", "layer": "red"},
					{"class": "normal", "layer": "red"},
					{"class": "normal", "layer": "red"},
					{"class": "normal", "layer": "red"}
				]
			},
			"blue": {
				layers: 2,
				index: 1,
				rbe: 2,
				health: 1,
				density: 1,
				speed: 2,
				children: [
					{"class": "normal", "layer": "blue"},
					{"class": "normal", "layer": "blue"},
					{"class": "normal", "layer": "blue"},
					{"class": "normal", "layer": "blue"}
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
					{"class": "normal", "layer": "green"},
					{"class": "normal", "layer": "green"},
					{"class": "normal", "layer": "green"},
					{"class": "normal", "layer": "green"}
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
					{"class": "normal", "layer": "yellow"},
					{"class": "normal", "layer": "yellow"},
					{"class": "normal", "layer": "yellow"},
					{"class": "normal", "layer": "yellow"}
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
					{"class": "normal", "layer": "pink"},
					{"class": "normal", "layer": "pink"},
					{"class": "normal", "layer": "pink"},
					{"class": "normal", "layer": "pink"}
				]
			}
		},
		"tack": {
			"sprite": "spr_tack_bloon",
			"object": "obj_tack_bloon",
			max_health: 1,
			"pink": {
				layers: 1,
				index: 0,
				rbe: 1,
				health: 1,
				density: 1,
				speed: 2
			},
		},
		"bomb": {
			"sprite": "spr_bomb_bloon",
			"object": "obj_bomb_bloon",
			max_health: 1,
			"red": {
				layers: 1,
				index: 0,
				rbe: 1,
				health: 1,
				density: 1,
				speed: 2.5
			},
		},
		"ice": {
			"sprite": "spr_ice_bloon",
			"object": "obj_ice_bloon",
			max_health: 1,
			"blue": {
				layers: 1,
				index: 0,
				rbe: 1,
				health: 1,
				density: 1,
				speed: 1.5
			},
		},
		"water": {
			"sprite": "spr_water_bloon",
			"object": "obj_water_bloon",
			max_health: 1,
			"red": {
				layers: 1,
				index: 0,
				rbe: 1,
				health: 1,
				density: 1,
				speed: 2.4
			},
		},
		"bee": {
			"object": "obj_bee_bloon",
			"sprite": "spr_bee_bloon",
			"big_bloon_tier": 1,
			"height": 5,
			"bee": {
				layers: 12,
				index: 0,
				rbe: 21,
				health: 6,
				max_health: 6,
				density: 1,
				speed: 2.3,
				children: [
					{"class": "normal", "layer": "black", "properties": ["float to track"]},
					{"class": "normal", "layer": "yellow", "properties": ["float to track"]}
				]
			},
			"sturdy bee": {
				layers: 18,
				index: 0,
				rbe: 27,
				health: 12,
				max_health: 12,
				density: 1,
				speed: 2.3,
				children: [
					{"class": "normal", "layer": "black", "properties": ["float to track"]},
					{"class": "normal", "layer": "yellow", "properties": ["float to track"]}
				]
			}
		},
		"bloom": {
			"object": "obj_bloom_bloon",
			"big_bloon_tier": 1,
			"height": 5,
			"remaining_value": 1,
			"bloom": {
				sprite: "spr_bloom_bloon",
				layers: 8,
				index: 0,
				rbe: 24,
				health: 4,
				max_health: 4,
				density: 1,
				speed: 1.9,
				children: [
					{"class": "splitter", "layer": "lime"},
					{"class": "splitter", "layer": "lime"},
				]
			},
			"spring": {
				layers: 12,
				sprite: "spr_spring_bloom_bloon",
				index: 0,
				rbe: 39,
				health: 6,
				max_health: 6,
				density: 1,
				speed: 2.3,
				children: [
					{"class": "splitter", "layer": "purple"},
					{"class": "splitter", "layer": "purple"},
				]
			}
		},
		"pot": {
			"object": "obj_pot_ceramic",
			"ceramic": {
				sprite: "spr_pot_ceramic_bloon",
				layers: 27,
				index: 0,
				rbe: 171,
				health: 15,
				max_health: 15,
				density: 1,
				speed: 2.35,
				children: [
					{
						"class": "bloom",
						"layer": "spring"
					},
					{
						"class": "bloom",
						"layer": "spring"
					},
					{
						"class": "bloom",
						"layer": "spring"
					},
					{
						"class": "bloom",
						"layer": "spring"
					}
				]
			},
		},
		"beehive": {
			"object": "obj_beehive_bloon",
			"bee": {
				sprite: "spr_beehive_bloon",
				layers: 312,
				index: 0,
				rbe: 930,
				health: 300,
				max_health: 300,
				density: 1,
				speed: 0.8,
				children: [
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"},
					{"class": "bee", "layer": "bee"}
				]
			}
		},
		"bear": {
			"object": "obj_bear_bloon",
			"big_bloon_tier": 7,
			"beekeeper": {
				sprite: "spr_bear_bloon",
				layers: 6600,
				rbe: 6600,
				damage: 60,
				health: 6600,
				density: 1,
				speed: 1.6,
			}
		}
	}
}