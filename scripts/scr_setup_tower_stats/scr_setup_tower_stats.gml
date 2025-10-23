// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_tower_stats(){

	return {
		"jim": {
			tower_object: "obj_hero",
			tower_sprite: "spr_jim",
			butt_sprite: "spr_jim_hero_butt",
			total_cost: 300,
			upgrade_cost: 0,
			range: 110,
			delay: 30,
			attack_cooldown: 0,
			health: 200,
			max_health: 200,
			abilities: {
				"Power Dart": {
					"charge_time": 30,
					"charge": 0,
					"max_charges": 3,
					"charges": 3,
					"ability_script": scr_power_dart
				}
			},
	
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
						upgrade_cost: 140
					}, 
					{
						keyword: "stronger",
						upgrade_cost: 170
					}, 
					{
						keyword: "stronger",
						upgrade_cost: 200
					}
				],
				[
					{
						keyword: "faster",
						upgrade_cost: 150
					}, 
					{
						keyword: "faster",
						upgrade_cost: 220
					}, 
					{
						keyword: "faster",
						upgrade_cost: 300
					}
				],
				[
					{
						keyword: "darter",
						upgrade_cost: 270
					}, 
					{
						keyword: "darter",
						upgrade_cost: 400
					}, 
					{
						keyword: "darter",
						upgrade_cost: 540
					}
				]
			],
			split_upgrades: [
				[
					{
						keyword: "Splodey Darts",
						upgrade_cost: 3100
					},
					{
						keyword: "carpet bombing",
						upgrade_cost: 9300
					}
				],
				[
				],
				[
					{
						keyword: "Split Darts",
						upgrade_cost: 2700
					},
					{
						keyword: "darterest darts",
						upgrade_cost: 5700
					}
				]
			]
		},
		"angry_squirrel": {
			tower_object: "obj_hero",
			tower_sprite: "spr_angry_squirrel",
			butt_sprite: "spr_angry_squirrel_hero_butt",
			total_cost: 450,
			upgrade_cost: 0,
			range: 115,
			delay: 24,
			attack_cooldown: 0,
			health: 200,
			max_health: 200,
			stat_boosts: {},
			damage_scripts: [
				scr_angry_squirrel_anger
			],
	
			projectile_stats: [
				{
					sprite: "spr_acorn",
					pierce: 2,
					damage: 1,
					speed: 12,
					lifespan: 30
				}
			],
			upgrades: [
				[
					{
						keyword: "Instigator",
						upgrade_cost: 100
					},
					{
						keyword: "Poke",
						upgrade_cost: 400
					},
					{
						keyword: "Lingering Flame",
						upgrade_cost: 800
					}
				],
				[
					{
						keyword: "Venting",
						upgrade_cost: 150
					},
					{
						keyword: "Bigger Acorns",
						upgrade_cost: 200
					},
					{
						keyword: "Beefed-Up Squirrel",
						upgrade_cost: 1050
					}
				]
			],
			split_upgrades: [
				[
					{	
						keyword: "Fiery Rage",
						upgrade_cost: 2400
					},
					{
						keyword: "Acorn Assault",
						upgrade_cost: 3900
					}
				],
				[
					{
						keyword: "Tree Tossing",
						upgrade_cost: 2500
					},
					{
						keyword: "Rampage",
						upgrade_cost: 7500
					}
				],
				[]
			]
		},
		"clown_monkey": {
			tower_object: "obj_clown_monkey",
			tower_sprite: "spr_clown_monkey",
			butt_sprite: "spr_clown_monkey_hero_butt",
			total_cost: 300,
			upgrade_cost: 0,
			range: 150,
			delay: 30,
			attack_cooldown: 0,
			health: 200,
			max_health: 200,
			stat_boosts: {},
	
			projectile_stats: [],
			upgrades: [
				[
					{
						keyword: "Tack Bloons",
						upgrade_cost: 270
					},
					{
						keyword: "Bomb Bloons",
						upgrade_cost: 420
					},
					{
						keyword: "Ice Bloons",
						upgrade_cost: 500
					}
				],
				[
					{
						keyword: "Higher Quality Animals",
						upgrade_cost: 300
					},
					{
						keyword: "Increased Bloon Flow",
						upgrade_cost: 750
					},
					{
						keyword: "Special Deliveries",
						upgrade_cost: 750
					}
				]
			],
			split_upgrades: [
				[],
				[],
				[
					{
						keyword: "Clown Moab",
						upgrade_cost: 1500
					},
					{
						keyword: "Piñata",
						upgrade_cost: 6000
					}
				]
			]
		},
		"trickster": {
			tower_object: "obj_trickster",
			tower_sprite: "spr_trickster",
			butt_sprite: "spr_trickster_hero_butt",
			total_cost: 600,
			upgrade_cost: 0,
			range: 150,
			delay: 240,
			attack_cooldown: 0,
			health: 250,
			max_health: 250,
			stat_boosts: {},
	
			projectile_stats: [
				{
					object: "obj_yoyo",
					sprite: "spr_yoyo",
					pierce: 100,
					damage: 1,
					speed: 8,
					lifespan: 999999,
					tick_frequency: 45
				}
			],
			upgrades: [
				[
					{
						keyword: "Walk the Bloon",
						upgrade_cost: 450
					},
					{
						keyword: "Around the World",
						upgrade_cost: 300
					},
					{
						keyword: "Professional Grade Yoyos",
						upgrade_cost: 750
					}
				],
				[
					{
						keyword: "Faster Setup",
						upgrade_cost: 300
					},
					{
						keyword: "Hand Eye Coordination",
						upgrade_cost: 450
					},
					{
						keyword: "Finishing Performance",
						upgrade_cost: 600
					}
				]
			],
			split_upgrades: [
				[
					{
						keyword: "Hot Streak",
						upgrade_cost: 3000
					},
					{
						keyword: "Morningstar",
						upgrade_cost: 7500
					}
				],
				[
				],
				[
				]
			]
		},
		"sling_shot_monkey": {
			tower_sprite: "spr_pebble_monkey",
			butt_sprite: "spr_sling_shot_tower_butt",
			total_cost: 250,
			upgrade_cost: 0,
			range: 120,
			delay: 36,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_stone",
					pierce: 3,
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
				[],
				[
					{
						keyword: "stone skipping",
						upgrade_cost: 150
					},
					{
						keyword: "sharp sight",
						upgrade_cost: 150
					}
				]
			],
			split_upgrades: [
				[
					{
						keyword: "Long Shot",
						upgrade_cost: 750
					},
					{
						keyword: "Goliath Shot",
						upgrade_cost: 3000
					}
				]
			]
		},
		"cactus_monkey": {
			tower_sprite: "spr_cactus_monkey",
			butt_sprite: "spr_cactus_monkey_tower_butt",
			total_cost: 350,
			upgrade_cost: 0,
			range: 105,
			delay: 34,
			attack_cooldown: 0,
			attack_angle_offset: 0,
			tower_attack_script: scr_cactus_base_alternate,
			no_target: true,
	
			projectile_stats: [
				{
					sprite: "spr_needle",
					projectile_count: 4,
					projectile_spread: 90,
					direction: 0,
					pierce: 1,
					damage: 1,
					speed: 8,
					lifespan: 15,
					height: 4,
					lobbing: {
						gravity: 0.5,
						speed: 3.5
					}
				}
			],
			upgrades: [
				[],
				[
					{
						keyword: "pointy-er needles",
						upgrade_cost: 200
					},
					{
						keyword: "faster unload",
						upgrade_cost: 300
					},
				]
			],
			split_upgrades: [
				[
					{
						keyword: "Bandito",
						upgrade_cost: 1200
					},
					{
						keyword: "needle storm",
						upgrade_cost: 3300
					}
				],
			]
		},
		"marbles_monkey": {
			tower_sprite: "spr_marbles_monkey",
			butt_sprite: "spr_marbles_monkey_tower_butt",
			total_cost: 450,
			upgrade_cost: 0,
			range: 155,
			delay: 59,
			attack_cooldown: 0,
			camo_detection: true,
	
			projectile_stats: [
				{
					sprite: "spr_marble",
					pierce: 2,
					damage: 1,
					speed: 8,
					lifespan: 120,
					friction: 0.2,
					image_angle: 0,
					camo_detection: true
				},
				{
					sprite: "spr_marble",
					pierce: 2,
					damage: 1,
					speed: 6,
					direction: -30,
					lifespan: 120,
					friction: 0.2,
					image_angle: 0,
					camo_detection: true
				},
				{
					sprite: "spr_marble",
					pierce: 2,
					damage: 1,
					speed: 6,
					direction: 30,
					lifespan: 120,
					friction: 0.2,
					image_angle: 0,
					camo_detection: true
				}
			],
			upgrades: [
				[],
				[
					{
						keyword: "bigger marbles",
						upgrade_cost: 350
					},
					{
						keyword: "bigger bag",
						upgrade_cost: 450
					}
				]
			],
			split_upgrades: [
				[
					{
						keyword: "Spinning Tops",
						upgrade_cost: 2100
					},
					{
						keyword: "Razor Blades",
						upgrade_cost: 5900
					}
				]
			]
		},
		"pogo_stick_monkey": {
			tower_sprite: "spr_pogo_stick_monkey",
			tower_object: "obj_pogo_stick_monkey",
			butt_sprite: "spr_pogo_stick_monkey_tower_butt",
			tower_base: true,
			tower_base_sprite: "spr_pogo_pad",
			total_cost: 390,
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
				],
				[
					{
						keyword: "Heavy Hops",
						upgrade_cost: 210
					},
					{
						keyword: "Quick Hops",
						upgrade_cost: 260
					}
				]
			],
			split_upgrades: [
				[
					{
						keyword: "Jumbo Jump",
						upgrade_cost: 1800
					},
					{
						keyword: "Jet Jumbo",
						upgrade_cost: 3900
					}
				],
				[
					{
						keyword: "Jackhammer",
						upgrade_cost: 1160
					},
					{
						keyword: "Drill",
						upgrade_cost: 3150
					}
				]
			]
		},
		"pineapple_monkey": {
			tower_sprite: "spr_pineapple_monkey",
			butt_sprite: "spr_pineapple_monkey_tower_butt",
			total_cost: 475,
			upgrade_cost: 0,
			range: 200,
			minimum_range: 90,
			delay: 78,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					object: "obj_no_hit",
					sprite: "spr_small_pineapple",
					lead_hit: true,
					pierce: 40,
					damage: 1,
					speed: 5,
					direction: 0,
					lifespan: 30,
					image_angle: 0,
					height: 0,
					lobbing: {
						gravity: 0.5,
						speed: 7.5
					},
					expire_burst_activation: true,
					projectile_burst: [
						{
							object: "obj_explosion_projectile",
							sprite: "spr_explosion",
							lead_hit: true,
							lifespan: 20,
							speed: 0,
							direction: 0,
							damage: 1,
							pierce: 40,
							size: 0.6,
							particles: 3
						}
					]
				}
			],
			upgrades: [
				[],
				[
					{
						keyword: "bigger pineapples",
						upgrade_cost: 325
					},
					{
						keyword: "faster growth",
						upgrade_cost: 350
					},
				]
			],
			split_upgrades: [
				[
					{
						keyword: "grilled pineapples",
						upgrade_cost: 1200
					}
				],
				[
					{
						keyword: "Pineapple Express",
						upgrade_cost: 950
					},
					{
						keyword: "pineapple split",
						upgrade_cost: 3500
					}
				]
			]
		},
		"assassin_monkey": {
			tower_sprite: "spr_assassin_monkey",
			tower_object: "obj_assassin_monkey",
			butt_sprite: "spr_assassin_tower_butt",
			total_cost: 590,
			upgrade_cost: 0,
			range: 240,
			delay: 210,
			attack_cooldown: 0,
			attack_barrages: 1,
			barrage_count: 0,
			barrage_delay: 30,
			barrage_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_knife",
					pierce: 25,
					damage: 4,
					speed: 9,
					friction: 1,
					lifespan: 30
				}
			],
			upgrades: [
				[],
				[
					{
						keyword: "Twin Blades",
						upgrade_cost: 490
					},
					{
						keyword: "Shadowy Sight",
						upgrade_cost: 420
					}
				]
			],
			split_upgrades: [
				[
					{
						keyword: "Multi-Strikes",
						upgrade_cost: 1590
					},
					{
						keyword: "Shadow Clones",
						upgrade_cost: 3990
					}
				]
			]
		},
		"haunted_monkey": {
			tower_sprite: "spr_haunted_monkey",
			tower_object: "obj_haunted_monkey",
			butt_sprite: "spr_haunted_tower_butt",
			total_cost: 425,
			upgrade_cost: 0,
			range: 125,
			delay: 25,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_ectoplasm",
					pierce: 2,
					damage: 1,
					speed: 12,
					lifespan: 30
				}
			],
			upgrades: [
				[
				],
				[
					{
						keyword: "Party House",
						upgrade_cost: 350
					},
					{
						keyword: "Full House",
						upgrade_cost: 300
					}
				]
			],
			split_upgrades: [
				[
				],
				[
					{
						keyword: "Chase Scene",
						upgrade_cost: 1300
					},
					{
						keyword: "Jump Scare",
						upgrade_cost: 5100
					}
				]
			]
		},
		"goonkey": {
			tower_sprite: "spr_goonkey",
			butt_sprite: "spr_goonkey_tower_butt",
			total_cost: 330,
			upgrade_cost: 0,
			range: 110,
			delay: 39,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_goop",
					pierce: 2,
					damage: 0,
					speed: 13,
					lifespan: 20,
					goop: 1,
					goop_time: 180
				}
			],
			upgrades: [
				[
				],
				[
					{
						keyword: "Piercing Goop",
						upgrade_cost: 350
					},
					{
						keyword: "Split Splatter",
						upgrade_cost: 530
					}
				]
			],
			split_upgrades: [
				[
				],
				[
					{
						keyword: "Goo Cube",
						upgrade_cost: 1200
					},
					{
						keyword: "Goo Pool",
						upgrade_cost: 4200
					}
				]
			]
		},
		"caster_monkey": {
			tower_sprite: "spr_caster_monkey",
			butt_sprite: "spr_caster_monkey_butt",
			total_cost: 510,
			upgrade_cost: 0,
			range: 135,
			delay: 35,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_caster_shot",
					pierce: 3,
					damage: 1,
					speed: 10,
					lifespan: 60,
					spiral_homing_offset: 60,
					homing: true,
					lead_hit: true,
					projectile_spread: 30,
					stay_pointed: true,
				}
			],
			upgrades: [
				[
				],
				[
					{
						keyword: "Double Cast",
						upgrade_cost: 450
					},
					{
						keyword: "Pop Markings",
						upgrade_cost: 650
					}
				]
			],
			split_upgrades: [
				[
				],
				[
					{
						keyword: "Deep Engravement",
						upgrade_cost: 2300
					},
					{
						keyword: "Death Spiral",
						upgrade_cost: 6300
					}
				]
			]
		},
		"skateboard_monkey": {
			tower_sprite: "spr_skateboard_monkey",
			tower_object: "obj_skateboard_monkey",
			butt_sprite: "spr_skateboard_monkey_butt",
			tower_base: true,
			tower_base_sprite: "spr_grind_rail",
			total_cost: 570,
			upgrade_cost: 0,
			range: 160,
			delay: 60,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					object: "obj_stick_to_tower_proj",
					sprite: "spr_skateboard_monkey",
					pierce: 1000000,
					damage: 1,
					speed: 0,
					lifespan: 9999
				}
			],
			upgrades: [
				[
				],
				[
					{
						keyword: "Littering",
						upgrade_cost: 260
					},
					{
						keyword: "Pro Skater",
						upgrade_cost: 390
					}
				]
			],
			split_upgrades: [
				[
					{
						keyword: "Jumbo Jump",
						upgrade_cost: 1800
					},
					{
						keyword: "Jet Jumbo",
						upgrade_cost: 3900
					}
				],
				[
					{
						keyword: "Scooter",
						upgrade_cost: 1300
					},
					{
						keyword: "Motorbike",
						upgrade_cost: 5900
					}
				]
			]
		},
	}

}