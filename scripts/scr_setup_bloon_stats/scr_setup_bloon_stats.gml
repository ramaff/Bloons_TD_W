// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_bloon_stats(){
	return {
		"normal": {
			"sprite": "spr_bloon",
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
		},
		"lead": {
			"sprite": "spr_lead_bloon",
			"tattered_sprite": "spr_lead_tattered",
			"properties": [
				"metallic"
			],
			max_health: 1,
			"lead": {
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
		"deflation": {
			"object": "obj_deflation_bloon",
			"sprite": "spr_big_deflation_bloon",
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
			}
		},
		"nurse": {
			"object": "obj_nurse_bloon",
			"sprite": "spr_nurse_bloon",
			"red": {
				layers: 8,
				index: 0,
				rbe: 10,
				health: 6,
				density: 1,
				speed: 0.9,
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
				layers: 15,
				index: 1,
				rbe: 19,
				health: 12,
				density: 1,
				speed: 1.2,
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
				layers: 22,
				index: 2,
				rbe: 28,
				health: 18,
				density: 1,
				speed: 1.5,
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
				layers: 29,
				index: 3,
				rbe: 37,
				health: 24,
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
				layers: 36,
				index: 4,
				rbe: 46,
				health: 30,
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
				layers: 18,
				index: 0,
				rbe: 104,
				health: 10,
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
			}
		},
		"bully": {
			"object": "obj_bully",
			"bully": {
				layers: 1,
				damage: 5,
				health: 500,
				density: 1,
				speed: 1,
			},
			"red bully": {
				sprite: "spr_red_bully",
				layers: 500,
				damage: 2,
				health: 500,
				density: 1,
				speed: 1,
			},
			"blue bully": {
				sprite: "spr_blue_bully",
				layers: 1000,
				health: 1000,
				damage: 4,
				density: 1,
				speed: 1.2,
			},
			"green bully": {
				sprite: "spr_green_bully",
				layers: 1500,
				health: 1500,
				damage: 6,
				density: 1,
				speed: 1.4,
			},
			"yellow bully": {
				sprite: "spr_yellow_bully",
				layers: 2000,
				health: 2000,
				damage: 8,
				density: 1,
				speed: 1.8,
			},
			"big bully": {
				layers: 5000,
				health: 5000,
				damage: 10,
				density: 1,
				speed: 2,
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
				damage: 40,
				health: 1500,
				density: 1,
				speed: 1.7,
			}
		},
		"frankensteins_bloon": {
			"object": "obj_frankensteins_bloon",
			"green": {
				sprite: "spr_frankensteins_bloon",
				layers: 2400,
				damage: 50,
				health: 2400,
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
		}
	}
}