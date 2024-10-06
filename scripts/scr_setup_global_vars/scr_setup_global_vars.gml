// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_global_vars(){
	
	global.tower_stats = {
		"jim": {
			tower_object: "obj_hero",
			total_cost: 250,
			upgrade_cost: 0,
			range: 110,
			delay: 30,
			attack_cooldown: 0,
			health: 200,
			max_health: 200,
	
			projectile_stats: [
				{
					sprite: "spr_dart",
					pierce: 1,
					damage: 1,
					speed: 12,
					lifespan: 30
				}
			],
			upgrades: [
				[
					{
						keyword: "stronger",
						upgrade_cost: 100
					}, 
					{
						keyword: "stronger",
						upgrade_cost: 200
					}, 
					{
						keyword: "stronger",
						upgrade_cost: 400
					}
				],
				[
					{
						keyword: "faster",
						upgrade_cost: 150
					}, 
					{
						keyword: "faster",
						upgrade_cost: 300
					}, 
					{
						keyword: "faster",
						upgrade_cost: 600
					}
				],
				[
					{
						keyword: "darter",
						upgrade_cost: 200
					}, 
					{
						keyword: "darter",
						upgrade_cost: 400
					}, 
					{
						keyword: "darter",
						upgrade_cost: 800
					}
				]
			]
		},
		"angry squirrel": {
			tower_object: "obj_hero",
			tower_sprite: "spr_angry_squirrel",
			total_cost: 350,
			upgrade_cost: 0,
			range: 115,
			delay: 24,
			attack_cooldown: 0,
			health: 150,
			max_health: 150,
	
			projectile_stats: [
				{
					sprite: "spr_dart",
					pierce: 2,
					damage: 1,
					speed: 12,
					lifespan: 30
				}
			],
			upgrades: [
				[
					{
						keyword: "stronger",
						upgrade_cost: 100
					}
				],
				[
					{
						keyword: "faster",
						upgrade_cost: 150
					}
				]
			]
		},
		"sling_monkey": {
			tower_sprite: "spr_pebble_monkey",
			total_cost: 175,
			upgrade_cost: 0,
			range: 105,
			delay: 60,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_stone",
					pierce: 2,
					damage: 1,
					speed: 8,
					lifespan: 32,
					height: 21,
					lobbing: {
						gravity: 1,
						speed: 5
					}
				}
			],
			upgrades: [
				[
					{
						keyword: "stone skipping",
						upgrade_cost: 100
					}
				],
				[
					{
						keyword: "sharp sight",
						upgrade_cost: 150
					}
				]
			]
		},
		"marbles_monkey": {
			tower_sprite: "spr_marbles_monkey",
			total_cost: 300,
			upgrade_cost: 0,
			range: 95,
			delay: 40,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_marble",
					pierce: 3,
					damage: 1,
					speed: 8,
					lifespan: 120,
					friction: 0.25
				}
			],
			upgrades: [
				[
					{
						keyword: "bigger marbles",
						upgrade_cost: 250
					}
				],
				[
					{
						keyword: "marble bag",
						upgrade_cost: 450
					}
				]
			]
		},
		"pogo_stick_monkey": {
			tower_sprite: "spr_pogo_stick_monkey",
			tower_object: "obj_pogo_stick_monkey",
			tower_base: true,
			tower_base_sprite: "spr_pogo_pad",
			total_cost: 475,
			upgrade_cost: 0,
			range: 160,
			delay: 60,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_pogo_hop_splash",
					pierce: 15,
					damage: 1,
					speed: 0,
					lifespan: 20
				}
			],
			upgrades: [
				[
					{
						keyword: "Heavy Hops",
						upgrade_cost: 350
					},
					{
						keyword: "Pineapple Planter",
						upgrade_cost: 900
					},
					{
						keyword: "Pineapple Pogo",
						upgrade_cost: 3000
					}
				],
				[
					{
						keyword: "Quick Hops",
						upgrade_cost: 250
					},
					{
						keyword: "Jackhammer",
						upgrade_cost: 1800
					},
					{
						keyword: "Drill",
						upgrade_cost: 4500
					}
				]
			]
		}
	}
	
	global.upgrade_stats = {
		"jim": {
			"darter": {
				shot_count_multiplier: 2,
				upgrade_string: "shoots more darts."
			},
			"faster": {
				fire_rate_multiplier: 1.75,
				upgrade_string: "shoots more often."
			},
			"stronger": {
				pierce_multiplier: 2,
				upgrade_string: "shoots more poppier darts."
			}
		},
		"sling_monkey": {
			"stone skipping": {
				pierce: 2,
				lifespan: 32,
				upgrade_string: "stones skip and pop 2 more bloons."
			},
			"sharp sight": {
				camo_detection: true,
				range: 40,
				upgrade_string: "Allows the sling monkey to pop camo bloons, and target further."
			}
		},
		"marbles_monkey": {
			"bigger marbles": {
				pierce: 3,
				lifespan: 120,
				upgrade_string: "Marbles pop more bloons, and last longer"
			},
			"marble bag": {
				fire_rate_multiplier: 0.5,
				projectile_stats: [
					{
						sprite: "spr_marble",
						speed: 6
					},
					{
						sprite: "spr_marble",
						speed: 10
					},
					{
						sprite: "spr_marble",
						speed: 10
					},
					{
						sprite: "spr_marble",
						speed: 6
					}
				],
				upgrade_string: "Throws out 5 marbles at once, less often."
			}
		},
		"pogo_stick_monkey": {
			"Heavy Hops": {
				upgrade_script: scr_heavy_hops,
				upgrade_string: "Pogo stick hops further into the air, and comes back down with more force.",
				projectile_sprite: "spr_big_pogo_hop_splash",
				pierce_multiplier: 2
			},
			"Pineapple Planter": {
				upgrade_string: "Plant pineapples with each hop that explode after 3 seconds",
				projectile_stats: [
					{
						object: "obj_no_hit",
						sprite: "spr_pineapple",
						pierce: 40,
						damage: 1,
						speed: 0,
						lifespan: 90,
						image_angle: 0,
						expire_burst_activation: true,
						projectile_burst: [
							{
								object: "obj_explosion_projectile",
								sprite: "spr_explosion_damage",
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 40,
								size: 1.5,
								particles: 3
							}
						]
					}
				],
			},
			"Pineapple Pogo": {
				upgrade_string: "Plant jumbo pineapples that explode into more pineapples",
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_pogo_hop_splash",
						pierce: 15,
						damage: 1,
						speed: 0,
						lifespan: 20
					},
					{
						object: "obj_no_hit",
						sprite: "spr_large_pineapple",
						pierce: 80,
						damage: 1,
						speed: 0,
						lifespan: 90,
						image_angle: 0,
						expire_burst_activation: true,
						projectile_burst: [
							{
								object: "obj_explosion_projectile",
								sprite: "spr_explosion_damage",
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 80,
								size: 2,
								particles: 6
							},
							{
								object: "obj_no_hit",
								sprite: "spr_pineapple",
								pierce: 40,
								damage: 1,
								speed: 2,
								direction: 0,
								lifespan: 60,
								image_angle: 0,
								height: 0,
								lobbing: {
									gravity: 0.25,
									speed: 7.5
								},
								expire_burst_activation: true,
								projectile_burst: [
									{
										object: "obj_explosion_projectile",
										sprite: "spr_explosion_damage",
										lifespan: 20,
										speed: 0,
										direction: 0,
										damage: 1,
										pierce: 40,
										size: 1.5,
										particles: 3
									}
								]
							},
							{
								object: "obj_no_hit",
								sprite: "spr_pineapple",
								pierce: 40,
								damage: 1,
								speed: 2,
								direction: 120,
								lifespan: 60,
								image_angle: 0,
								height: 0,
								lobbing: {
									gravity: 0.25,
									speed: 7.5
								},
								expire_burst_activation: true,
								projectile_burst: [
									{
										object: "obj_explosion_projectile",
										sprite: "spr_explosion_damage",
										lifespan: 20,
										speed: 0,
										direction: 0,
										damage: 1,
										pierce: 40,
										size: 1.5,
										particles: 3
									}
								]
							},
							{
								object: "obj_no_hit",
								sprite: "spr_pineapple",
								pierce: 40,
								damage: 1,
								speed: 2,
								direction: 240,
								lifespan: 60,
								image_angle: 0,
								height: 0,
								lobbing: {
									gravity: 0.25,
									speed: 7.5
								},
								expire_burst_activation: true,
								projectile_burst: [
									{
										object: "obj_explosion_projectile",
										sprite: "spr_explosion_damage",
										lifespan: 20,
										speed: 0,
										direction: 0,
										damage: 1,
										pierce: 40,
										size: 1.5,
										particles: 3
									}
								]
							}
						]
					}
				]
			},
			"Pineapple Express": {
				upgrade_string: "Hops faster all along the track to deliver pineapples"
			},
			"Quick Hops": {
				upgrade_script: scr_quick_hops,
				upgrade_string: "Hops 50% faster"
			},
			"Jackhammer": {
				tower_sprite: "spr_jackhammer_monkey",
				upgrade_script: scr_jackhammer,
				upgrade_string: "Hops 3x faster"
			},
			"Drill": {
				tower_sprite: "spr_drill_monkey",
				upgrade_script: scr_drill,
				upgrade_string: "Shreds everything under it",
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_drill_splash",
						pierce: 20,
						damage: 1,
						speed: 0,
						lifespan: 20
					}
				],
			}
		}
	}

	global.bloon_stats = {
		"normal": {
			"sprite": "spr_bloon",
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
		"deflation": {
			"object": "obj_deflation_bloon",
			"sprite": "spr_big_deflation_bloon",
			"red": {
				layers: 11,
				index: 0,
				rbe: 14,
				health: 10,
				density: 1,
				speed: 2.7,
				children: [
					{
						"class": "splitter",
						"layer": "orange",
						"properties": [
							"tattered"
						]
					}
				]
			},
			"blue": {
				layers: 22,
				index: 0,
				rbe: 27,
				health: 20,
				density: 1,
				speed: 3.3,
				children: [
					{
						"class": "splitter",
						"layer": "orange",
						"properties": [
							"tattered"
						]
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
				health: 500,
				density: 1,
				speed: 1,
			}
		}
		
		
	}

}