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
			},
			"split dart monkey": {
				range: 15,
				health: 50,
				max_health: 50,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_dart",
						pierce: 4,
						projectile_count: 4,
						projectile_spread: 15,
						damage: 1,
						speed: 12,
						lifespan: 30,
						expire_burst_activation: true,
						projectile_burst: [
							{
								projectile_count: 4,
								projectile_spread: 90,
								sprite: "spr_dart",
								pierce: 4,
								damage: 1,
								speed: 12,
								lifespan: 30,
							},
						]
					}
				],
				upgrade_string: "Darts split into 4 more darts. Jim gets more HP and range."
			},
			"darterer": {
				range: 15,
				shot_count: 4,
				health: 50,
				max_health: 50,
				upgrade_string: "shoots so many more darts."
			},
		},
		"sling_shot_monkey": {
			"stone skipping": {
				pierce: 2,
				lifespan: 32,
				upgrade_string: "stones skip and pop 2 more bloons."
			},
			"sharp sight": {
				camo_detection: true,
				range: 40,
				upgrade_string: "Allows the sling monkey to pop camo bloons, and target further."
			},
			"long shot": {
				fire_rate_multiplier: 1.333,
				range: -40,
				tower_attack_script: scr_long_shot_boost,
				upgrade_string: "The range and damage of the sling shot increases over time the longer a shot is prepared."
			},
			"Goliath Shot": {
				fire_rate_multiplier: 2.166,
				upgrade_string: "When charged enough, the sling applies a devastating effect to big bloons. Much faster charging."
			}
		},
		"angry_squirrel": {
			"Anger Mismanagement": {
				upgrade_string: "The squirrel stays mad twice as long."
			},
			"Poke": {
				upgrade_string: "Poke the squirrel to make it angry.",
				abilities: {
					"Poke": {
						"charge_time": 40,
						"charge": 40,
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
						sprite: "spr_bigger_acorn",
						pierce: 6,
						damage: 2,
						speed: 18,
						lifespan: 60
					}
				],
				range: 15,
				health: 100,
				max_health: 100,
				upgrade_string: "The squirrel has 100 more health, and throws acorns twice as hard!"
			},
			"Venting": {
				upgrade_string: "The squirrel regains some of its health whenever it gets angry",
			},
			"Acorn Assault": {
				upgrade_string: "While angry, release a massively increased amount of acorns.",
				health: 50,
				max_health: 50,
				range: 15,
			}
		},
		"clown_monkey": {
			"Tack Bloons": {
				upgrade_string: "Spawns bloons that explode into 8 tacks when popped.",
				upgrade_script: scr_start_tack_bloon_flow
			},
			"Bomb Bloons": {
				upgrade_string: "Spawns bloons that explode into an explosion when popped.",
				upgrade_script: scr_start_bomb_bloon_flow
			},
			"Ice Bloons": {
				upgrade_string: "Spawns bloons that explode into a freezing burst when popped.",
				upgrade_script: scr_start_ice_bloon_flow
			},
			"Higher Quality Animals": {
				upgrade_string: "Creates higher tier bloon animals."
			},
			"Increased Bloon Flow": {
				upgrade_string: "Doubles bloon production."
			},
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
				fire_rate_multiplier: 1.333,
				projectile_replacement: true,
				tower_sprite: "spr_cactus_bandito",
				range: 60,
				projectile_stats: [
					{
						sprite: "spr_needle",
						projectile_count: 4,
						projectile_spread: 30,
						pierce: 2,
						damage: 1,
						speed: 16,
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
						speed: 16,
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
				range: 20,
				projectile_stats: [
					{
						sprite: "spr_needle",
						projectile_count: 2,
						projectile_spread: 30,
						pierce: 2,
						damage: 1,
						speed: 18,
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
						speed: 18,
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
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 8,
						lifespan: 180,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 6,
						lifespan: 180,
						direction: -30,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 6,
						lifespan: 180,
						direction: 30,
						friction: 0.2,
						image_angle: 0
					}
				],
				upgrade_string: "Marbles pop more bloons, and last longer"
			},
			"bigger bag": {
				range: 10,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 8,
						lifespan: 180,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 5,
						lifespan: 180,
						direction: -20,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 5,
						lifespan: 180,
						direction: 20,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 6.75,
						lifespan: 180,
						direction: -30,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 6.75,
						lifespan: 180,
						direction: 30,
						friction: 0.2,
						image_angle: 0
					}
				],
				upgrade_string: "Throws out 5 marbles at once."
			},
			"Spinning Tops": {
				range: 20,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 8,
						min_speed: 0.5,
						lifespan: 360,
						tick_frequency: 60,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 5,
						min_speed: 0.5,
						lifespan: 360,
						tick_frequency: 60,
						direction: -20,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 5,
						min_speed: 0.5,
						lifespan: 360,
						tick_frequency: 60,
						direction: 20,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 6.75,
						min_speed: 0.5,
						lifespan: 360,
						tick_frequency: 60,
						direction: -30,
						friction: 0.2,
						image_angle: 0
					},
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 6.75,
						min_speed: 0.5,
						lifespan: 360,
						tick_frequency: 60,
						direction: 30,
						friction: 0.2,
						image_angle: 0
					}
				],
				upgrade_string: "Throws spinning tops instead of marbles that pop much more bloons and can hit multiple times each."
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
						lifespan: 20,
						lead_hit: true
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
								sprite: "spr_explosion",
								lead_hit: true,
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 60,
								size: 0.65
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
				tower_sprite: "spr_pineapple_express_monkey",
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
								sprite: "spr_explosion",
								lead_hit: true,
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 60,
								size: 0.65,
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
								sprite: "spr_explosion",
								lead_hit: true,
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 80,
								size: 0.75,
								particles: 7
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
										sprite: "spr_explosion",
										lead_hit: true,
										lifespan: 20,
										speed: 0,
										direction: 0,
										damage: 1,
										pierce: 40,
										size: 0.5,
										particles: 3
									}
								]
							},
						]
					}
				]
			}
		},
		"haunted_monkey": {
			"Party House": {
				upgrade_script: scr_spawn_ghost_monkey,
				upgrade_string: "The monkey gets haunted by an additional ghost."
			},
			"Full House": {
				upgrade_script: scr_spawn_ghost_monkey,
				upgrade_string: "The monkey gets haunted by three ghosts."
			},
			"Chase Scene": {
				fire_rate_multiplier: 1.333,
				range: 40,
				upgrade_script: scr_upgrade_ghost_monkeys,
				upgrade_string: "The monkey gets haunted by three ghosts."
			},
			"Jump Scare": {
				fire_rate_multiplier: 1.666,
				range: 40,
				upgrade_script: scr_upgrade_ghost_monkeys,
				upgrade_string: "The ghosts jump scare bloons, causing them to quickly move backwards.",
				additional_attacks: [
					{
						delay: 75,
						attack_cooldown: 0,
						range: 40,
						projectile_stats: [
							{
								object: "obj_explosion_projectile",
								sprite: "spr_jump_scare_explosion",
								lead_hit: true,
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 40,
								bloon_pushback: 0.0666
							}
						]
					}
				]
			}
		},
		"assassin_monkey": {
			"Twin Blades": {
				shot_count: 1,
				upgrade_string: "Assassin is equiped with two blades now."
			},
			"Shadowy Sight": {
				camo_detection: true,
				range: 80,
				fire_rate_multiplier: 1.25,
				upgrade_string: "The assassin can see further and detect camo and attack slightly more often."
			},
			"Multi-Strikes": {
				attack_barrages: 2,
				upgrade_string: "Strike bloons multiple times."
			},
			"Shadow Clones": {
				fire_rate_multiplier: 1.25,
				upgrade_string: "Attacks faster with 2 additional shadow clones."
			}
		},
		"goonkey": {
			"Piercing Goop": {
				range: 10,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_goop",
						pierce: 4,
						damage: 1,
						speed: 13,
						lifespan: 20,
						goop: 1,
						goop_time: 180
					}
				],
				upgrade_string: "Goo balls hit 2 more bloons and pop bloons that are hit."
			},
			"Split Splatter": {
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_goop",
						pierce: 4,
						damage: 1,
						speed: 13,
						lifespan: 20,
						goop: 1,
						goop_time: 180,
						expire_burst_activation: true,
						projectile_burst: [
							{
								projectile_count: 4,
								projectile_spread: 90,
								sprite: "spr_goop",
								pierce: 4,
								damage: 1,
								speed: 13,
								lifespan: 10,
								goop: 1,
								goop_time: 180
							},
						]
					}
				],
				upgrade_string: "Goo balls split when hitting bloons."
			},
			"Goo Cube": {
				range: 10,
				additional_attacks: [
					{
						delay: 180,
						attack_cooldown: 0,
						range: 120,
						projectile_stats: [
							{
								sprite: "spr_goop",
								pierce: 1,
								damage: 0,
								speed: 20,
								lifespan: 20,
								expire_burst_activation: true,
								projectile_burst: [
									{
										sprite: "spr_goo_cube",
										pierce: 60,
										damage: 1,
										speed: 3,
										friction: 1,
										lifespan: 600,
										tick_frequency: 15,
										image_angle: 0,
										bloon_pushback: 0.05
									}
								]
							}
						]
					}
				],
				upgrade_string: "Puts bloons into goo cubes that block bloons from progressing further into the track."
			},
			"Goo Pool": {
				fire_rate_multiplier: 1.666,
				range: 20,
				upgrade_string: "Covers the nearby track with a goo pool that causes projectiles to stick to the ground for a long time.",
				additional_attacks: [
					{
						delay: 240,
						attack_cooldown: 0,
						range: 400,
						projectile_stats: [
							{
								sprite: "spr_goo_pool",
								projectile_count: 4,
								projectile_spread: 90,
								lifespan: 240,
								speed: 15,
								direction: 0,
								friction: 2.5,
								damage: 1,
								pierce: 40,
								tick_frequency: 120,
								goop: 1,
								goop_time: 180,
								image_angle: 0
							},
							{
								sprite: "spr_goo_pool",
								projectile_count: 6,
								projectile_spread: 60,
								lifespan: 240,
								speed: 24,
								direction: 0,
								friction: 4,
								damage: 1,
								pierce: 40,
								tick_frequency: 120,
								goop: 1,
								goop_time: 180,
								image_angle: 0
							}
						]
					}
				]
			}
		},
	}
}