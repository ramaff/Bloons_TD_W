// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_upgrade_stats(){
	return {
		"jim": {
			"darter": {
				shot_count: 1,
				upgrade_string: "shoots more darts."
			},
			"faster": {
				fire_rate_multiplier: 1.167,
				upgrade_string: "shoots more often."
			},
			"stronger": {
				pierce: 1,
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
		"angry squirrel": {
			"Anger Mismanagement": {
				upgrade_string: "The squirrel stays mad twice as long."
			},
			"Poke": {
				upgrade_string: "Poke the squirrel to make it angry.",
				abilities: {
					"Poke": {
						"charge_time": 45,
						"charge": 45,
						"max_charges": 1,
						"charges": 0,
						"ability_script": scr_angry_squirrel_anger
					}
				}
			},
			"Lingering Flame": {
				upgrade_string: "The squirrel remains slightly mad for 15 seconds after being provoked. Also boosts anger potency."
			},
			"Bigger Acorns": {
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_big_acorn",
						pierce: 4,
						damage: 1,
						speed: 12,
						lifespan: 60
					}
				],
				upgrade_string: "Throws bigger acorns that pop more bloons."
			},
			"Beefed-Up Squirrel": {
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_big_acorn",
						pierce: 6,
						damage: 2,
						speed: 18,
						lifespan: 60
					}
				],
				range: 15,
				health: 150,
				max_health: 150,
				upgrade_string: "The squirrel has twice as much health, and throws acorns twice as hard!"
			},
			"Vent": {
				upgrade_string: "The squirrel can throw nearby towers to regain some of its health and pop more bloons.",
				abilities: {
					"Vent": {
						"charge_time": 60,
						"charge": 60,
						"max_charges": 1,
						"charges": 0,
						"ability_script": scr_vent
					}
				}
			}
		},
		"cactus_monkey": {
			"pointy-er needles": {
				pierce: 1,
				upgrade_string: "Needles pop an additional bloon"
			},
			"faster unload": {
				fire_rate_multiplier: 1.666,
				upgrade_string: "Shoots out needles a lot faster."
			},
			"bandito": {
				upgrade_script: scr_bandito,
				fire_rate_multiplier: 1.166,
				projectile_replacement: true,
				range: 60,
				projectile_stats: [
					{
						sprite: "spr_needle",
						projectile_count: 4,
						projectile_spread: 30,
						pierce: 2,
						damage: 1,
						speed: 12,
						lifespan: 15,
						height: 4,
						lobbing: {
							gravity: 0.5,
							speed: 3.5
						}
					},
					{
						sprite: "spr_needle",
						projectile_count: 4,
						projectile_spread: 30,
						pierce: 2,
						damage: 1,
						direction: 180,
						speed: 12,
						lifespan: 15,
						height: 4,
						lobbing: {
							gravity: 0.5,
							speed: 3.5
						}
					}
				],
				upgrade_string: "Shoots from a gun"
			},
			"needle storm": {
				fire_rate_multiplier: 6,
				projectile_replacement: true,
				tower_attack_script: scr_needle_storm,
				range: 60,
				projectile_stats: [
					{
						sprite: "spr_needle",
						projectile_count: 2,
						projectile_spread: 30,
						pierce: 2,
						damage: 1,
						speed: 12,
						lifespan: 15,
						height: 4,
						lobbing: {
							gravity: 0.5,
							speed: 3.5
						}
					},
					{
						sprite: "spr_needle",
						projectile_count: 2,
						projectile_spread: 30,
						pierce: 2,
						damage: 1,
						direction: 180,
						speed: 12,
						lifespan: 15,
						height: 4,
						lobbing: {
							gravity: 0.5,
							speed: 3.5
						}
					}
				],
				upgrade_string: "Shoots from a gun"
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
		},
		"pineapple_monkey": {
			"bigger pineapples": {
				upgrade_string: "Throws pineapples that explode in a wider area",
				projectile_replacement: true,
				projectile_stats: [
					{
						object: "obj_no_hit",
						sprite: "spr_pineapple",
						lead_hit: true,
						pierce: 60,
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
								sprite: "spr_explosion_damage",
								lead_hit: true,
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 40,
								size: 1.4,
								particles: 5
							}
						]
					}
				]
			},
			"faster growth": {
				fire_rate_multiplier: 1.5,
				upgrade_string: "Throws pineapples 50% faster."
			},
			"pineapple express": {
				upgrade_string: "Tosses a bunch of pineapples without aiming.",
				attack_angle_offset: 0,
				fire_rate_multiplier: 1.33,
				tower_attack_script: scr_pineapple_juggling,
				projectile_replacement: true,
				no_target: true,
				projectile_stats: [
					{
						projectile_count: 3,
						projectile_spread: 120,
						object: "obj_no_hit",
						sprite: "spr_pineapple",
						lead_hit: true,
						pierce: 60,
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
								sprite: "spr_explosion_damage",
								lead_hit: true,
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 60,
								size: 1.4,
								particles: 5
							}
						]
					}
				]
			},
			"pineapple split": {
				upgrade_string: "Tosses big pineapples that split into more pineapples.",
				attack_angle_offset: 0,
				projectile_replacement: true,
				projectile_stats: [
					{
						projectile_count: 3,
						projectile_spread: 120,
						object: "obj_no_hit",
						sprite: "spr_large_pineapple",
						lead_hit: true,
						pierce: 80,
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
								sprite: "spr_explosion_damage",
								lead_hit: true,
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 80,
								size: 1.7,
								particles: 8
							},
							{
								projectile_count: 3,
								projectile_spread: 120,
								object: "obj_no_hit",
								sprite: "spr_pineapple",
								lead_hit: true,
								pierce: 30,
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
										lead_hit: true,
										lifespan: 20,
										speed: 0,
										direction: 0,
										damage: 1,
										pierce: 30,
										size: 1.1,
										particles: 3
									}
								]
							},
						]
					}
				]
			}
		}
	}
}