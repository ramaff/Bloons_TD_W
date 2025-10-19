// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_upgrade_stats(){
	return {
		"jim": {
			"darter": {
				shot_count: 1,
				upgrade_string: "Shoots one more dart and one more super dart."
			},
			"faster": {
				fire_rate_multiplier: 1.167,
				ability_charge_multiplier: 1.167,
				upgrade_string: "Shoots 16% faster. Super Dart recharges 16% faster."
			},
			"stronger": {
				pierce_add: 1,
				upgrade_string: "Darts pop 1 extra bloon. Super Dart pops 50 extra bloons and does +1 damage."
			},
			"Split Darts": {
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
			"darterest darts": {
				range: 45,
				health: 50,
				max_health: 50,
				fire_rate_multiplier: 1.333,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_dartest_dart",
						pierce: 4,
						projectile_count: 2,
						projectile_spread: 30,
						damage: 1,
						speed: 12,
						lifespan: 30,
						air_burst_range: 40,
						projectile_burst: [
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
						]
					}
				],
				upgrade_string: "Darts that shoot darts into more darts."
			},
			"Splodey Darts": {
				range: 20,
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
								object: "obj_explosion_projectile",
								sprite: "spr_explosion",
								lead_hit: true,
								lifespan: 20,
								speed: 0,
								direction: 0,
								damage: 1,
								pierce: 20,
								size: 0.4
							},
						]
					}
				],
				upgrade_string: "Darts explode into explosions. Jim gets more HP and range."
			},
			"carpet bombing": {
				range: 50,
				health: 50,
				max_health: 50,
				projectile_replacement: true,
				projectile_stats: [
					{
						object: "obj_no_hit",
						sprite: "spr_dart",
						pierce: 20,
						projectile_count: 4,
						projectile_spread: 15,
						damage: 1,
						speed: 12,
						lifespan: 30,
						extra_shots: [
							{
								object: "obj_no_hit",
								lead_hit: true,
								sprite: "spr_small_bomb",
								pierce: 20,
								damage: 1,
								speed: 0,
								image_angle: 0,
								lifespan: 15,
								lead_hit: true,
								shot_frequency: 6,
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
										pierce: 20,
										size: 0.4
									}
								]
							}
						]
					}
				],
				upgrade_string: "Darts leave a trail of bombs that explode. Jim gets more HP and range."
			},
		},
		"sling_shot_monkey": {
			"stone skipping": {
				pierce_add: 2,
				lifespan: 32,
				upgrade_string: "Stones skip and pop 2 more bloons."
			},
			"sharp sight": {
				camo_detection: true,
				range: 40,
				upgrade_string: "Allows the sling monkey to pop camo bloons, and target further."
			},
			"Long Shot": {
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
			"Instigator": {
				upgrade_string: "If the squirrel isn't angry yet and a bloon leaks, then it becomes the target of all incoming damage for three seconds. Also increases max health by 50.",
				health: 50,
				max_health: 50
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
				upgrade_string: "The squirrel regains some of its health whenever it gets angry.",
			},
			"Acorn Assault": {
				upgrade_string: "While angry, release a massively increased amount of acorns.",
				health: 100,
				max_health: 100,
				range: 15,
			},
			"Fiery Rage": {
				upgrade_string: "Acorns set bloons on fire. Fire burns through lead and does damage over time",
				health: 50,
				max_health: 50,
				range: 15,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_bigger_acorn_on_fire",
						pierce: 6,
						damage: 2,
						speed: 18,
						lifespan: 60,
						fire: 1,
						fire_time: 120,
						lead_hit: true
					}
				],
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
			"Special Deliveries": {
				upgrade_string: "Send in a box that generates a large number of extra clown bloons. Bloon type is determined by the Clown's current targetting option.",
				abilities: {
					"Special Delivery": {
						"charge_time": 30,
						"charge": 30,
						"max_charges": 2,
						"charges": 1,
						"ability_script": scr_special_delivery
					}
				}
			},
			"Clown Moab": {
				upgrade_string: "Instead of bloon animals, spawn a clown moab that contains a large number of bloon animals. Also doubles the number of special delivery boxes.",
				tower_sprite: "spr_party_clown_monkey",
				health: 50,
				max_health: 50,
			},
		},
		"trickster": {
			"Walk the Bloon": {
				upgrade_string: "Additional yoyo that performs the 'Walk the Bloon' trick.",
				additional_attacks: [
					{
						delay: 240, attack_cooldown: 0, range: 150,
						projectile_stats: [
							{
								object: "obj_walk_the_bloon_yoyo", sprite: "spr_yoyo", pierce: 100, damage: 1, speed: 8, lifespan: 999999, tick_frequency: 45
							}
						]
					}
				]
			},
			"Around the World": {
				upgrade_string: "Additional yoyo that performs the 'Around the World' trick.",
				additional_attacks: [
					{
						delay: 240, attack_cooldown: 0, range: 150,
						projectile_stats: [
							{
								object: "obj_around_the_world_yoyo", sprite: "spr_yoyo", pierce: 100, damage: 1, speed: 8, lifespan: 999999, tick_frequency: 45
							}
						]
					}
				]
			},
			"Professional Grade Yoyos": {
				upgrade_string: "Yoyos pop twice as many bloons before needing to be refreshed. They also pop bloons 50% more often.",
				projectile_replacement: true,
				upgrade_script: scr_trickster_projectile_replace,
				projectile_stats: [
					{
						object: "obj_yoyo", sprite: "spr_pro_yoyo", pierce: 200, damage: 1, speed: 8, lifespan: 999999, tick_frequency: 30
					}
				],
				additional_attacks: [
					{
						delay: 240, attack_cooldown: 0, range: 150,
						projectile_stats: [
							{
								object: "obj_around_the_world_yoyo", sprite: "spr_pro_yoyo", pierce: 200, damage: 1, speed: 8, lifespan: 999999, tick_frequency: 30
							}
						]
					},
					{
						delay: 240, attack_cooldown: 0, range: 150,
						projectile_stats: [
							{
								object: "obj_walk_the_bloon_yoyo", sprite: "spr_pro_yoyo", pierce: 200, damage: 1, speed: 8, lifespan: 999999, tick_frequency: 30
							}
						]
					}
				]
			},
			"Hot Streak": {
				upgrade_string: "Yoyos pop twice as many bloons, pop twice as often, and can pop lead",
				projectile_replacement: true,
				upgrade_script: scr_trickster_projectile_replace,
				projectile_stats: [
					{
						object: "obj_yoyo", sprite: "spr_hot_yoyo", pierce: 400, damage: 1, speed: 10, lifespan: 999999, tick_frequency: 15, lead_hit: true
					}
				],
				additional_attacks: [
					{
						delay: 240, attack_cooldown: 0, range: 150,
						projectile_stats: [
							{
								object: "obj_around_the_world_yoyo", sprite: "spr_hot_yoyo", pierce: 400, damage: 1, speed: 10, lifespan: 999999, tick_frequency: 15, lead_hit: true
							}
						]
					},
					{
						delay: 240, attack_cooldown: 0, range: 150,
						projectile_stats: [
							{
								object: "obj_walk_the_bloon_yoyo", sprite: "spr_hot_yoyo", pierce: 400, damage: 1, speed: 10, lifespan: 999999, tick_frequency: 15, lead_hit: true
							}
						]
					}
				]
			},
			"Morningstar": {
				upgrade_string: "Morningstars do double damage, pop way more bloons, and knock them back.",
				projectile_replacement: true,
				upgrade_script: scr_trickster_projectile_replace,
				projectile_stats: [
					{
						object: "obj_yoyo", sprite: "spr_morningstar", pierce: 750, damage: 2, speed: 12, lifespan: 999999, tick_frequency: 15, lead_hit: true, bloon_pushback: 0.0125
					}
				],
				additional_attacks: [
					{
						delay: 240, attack_cooldown: 0, range: 150,
						projectile_stats: [
							{
								object: "obj_around_the_world_yoyo", sprite: "spr_morningstar", pierce: 750, damage: 2, speed: 12, lifespan: 999999, tick_frequency: 15, lead_hit: true, bloon_pushback: 0.0125
							}
						]
					},
					{
						delay: 240, attack_cooldown: 0, range: 150,
						projectile_stats: [
							{
								object: "obj_walk_the_bloon_yoyo", sprite: "spr_morningstar", pierce: 750, damage: 2, speed: 12, lifespan: 999999, tick_frequency: 15, lead_hit: true, bloon_pushback: 0.0125
							}
						]
					}
				]
			},
			"Faster Setup": {
				upgrade_string: "Refresh yoyos 50% faster",
				fire_rate_multiplier: 1.5
			},
			"Hand Eye Coordination": {
				upgrade_string: "Increases yoyo range and detects camo.",
				range: 40,
				camo_detection: true
			},
			"Finishing Performance": {
				upgrade_string: "Spawn two extra sets of yoyos. Can be charged up twice.",
				abilities: {
					"Finishing Performance": {
						"charge_time": 40,
						"charge": 40,
						"max_charges": 2,
						"charges": 0,
						"ability_script": scr_finishing_performance
					}
				}
			},
		},
		"cactus_monkey": {
			"pointy-er needles": {
				pierce_add: 1,
				upgrade_string: "Needles pop an additional bloon"
			},
			"faster unload": {
				fire_rate_multiplier: 1.666,
				upgrade_string: "Shoots out needles a lot faster."
			},
			"Bandito": {
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
				upgrade_string: "Shoots from two guns. Increased range and firerate."
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
				upgrade_string: "Shoots very rapidly from it's guns."
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
						lifespan: 240,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 6,
						lifespan: 240,
						direction: -30,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 6,
						lifespan: 240,
						direction: 30,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
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
						lifespan: 240,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 5,
						lifespan: 240,
						direction: -20,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 5,
						lifespan: 240,
						direction: 20,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 6.75,
						lifespan: 240,
						direction: -30,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_bigger_marble",
						pierce: 5,
						damage: 1,
						speed: 6.75,
						lifespan: 240,
						direction: 30,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					}
				],
				upgrade_string: "Throws out 5 marbles at once."
			},
			"Spinning Tops": {
				range: 20,
				projectile_replacement: true,
				tower_sprite: "spr_spinning_top_monkey",
				projectile_stats: [
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 8,
						min_speed: 0.5,
						lifespan: 420,
						tick_frequency: 60,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 5,
						min_speed: 0.5,
						lifespan: 420,
						tick_frequency: 60,
						direction: -20,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 5,
						min_speed: 0.5,
						lifespan: 420,
						tick_frequency: 60,
						direction: 20,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 6.75,
						min_speed: 0.5,
						lifespan: 420,
						tick_frequency: 60,
						direction: -30,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_spinning_top",
						pierce: 18,
						damage: 1,
						speed: 6.75,
						min_speed: 0.5,
						lifespan: 420,
						tick_frequency: 60,
						direction: 30,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					}
				],
				upgrade_string: "Throws spinning tops instead of marbles that pop much more bloons and can hit multiple times each."
			},
			"Razor Blades": {
				range: 20,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_spinning_blade_top",
						pierce: 75,
						damage: 1,
						speed: 8,
						min_speed: 0.5,
						lifespan: 480,
						tick_frequency: 15,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_spinning_blade_top",
						pierce: 75,
						damage: 1,
						speed: 5,
						min_speed: 0.5,
						lifespan: 480,
						tick_frequency: 15,
						direction: -20,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_spinning_blade_top",
						pierce: 75,
						damage: 1,
						speed: 5,
						min_speed: 0.5,
						lifespan: 480,
						tick_frequency: 15,
						direction: 20,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_spinning_blade_top",
						pierce: 75,
						damage: 1,
						speed: 6.75,
						min_speed: 0.5,
						lifespan: 480,
						tick_frequency: 15,
						direction: -30,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					},
					{
						sprite: "spr_spinning_blade_top",
						pierce: 75,
						damage: 1,
						speed: 6.75,
						min_speed: 0.5,
						lifespan: 480,
						tick_frequency: 15,
						direction: 30,
						friction: 0.2,
						image_angle: 0,
						camo_detection: true
					}
				],
				upgrade_string: "Spinning tops have blades now which rapidly shred bloons."
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
				upgrade_string: "Shreds everything under it. Can also pop lead.",
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
								size: 0.75
							}
						]
					}
				]
			},
			"faster growth": {
				fire_rate_multiplier: 1.5,
				upgrade_string: "Throws pineapples 50% faster."
			},
			"Pineapple Express": {
				upgrade_string: "Tosses a bunch of pineapples without aiming.",
				attack_angle_offset: 0,
				fire_rate_multiplier: 1.16,
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
								size: 0.75,
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
						pierce: 120,
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
								size: 0.9,
								particles: 7
							},
							{
								projectile_count: 3,
								projectile_spread: 120,
								object: "obj_no_hit",
								sprite: "spr_pineapple",
								lead_hit: true,
								pierce: 60,
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
										pierce: 60,
										size: 0.75,
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
				fire_rate_multiplier: 1.666,
				range: 40,
				upgrade_script: scr_upgrade_ghost_monkeys,
				upgrade_string: "Ghosts chase after bloons across the entire track. Also shoots faster."
			},
			"Jump Scare": {
				fire_rate_multiplier: 1.666,
				range: 40,
				upgrade_script: scr_upgrade_ghost_monkeys,
				upgrade_string: "The ghosts jump scare bloons in a small area, causing them to quickly move backwards. The jumpscares can pop lead.",
				additional_attacks: [
					{
						delay: 60,
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
				range: 20,
				camo_detection: true,
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
						camo_detection: true,
						expire_burst_activation: true,
						projectile_burst: [
							{
								projectile_count: 4,
								projectile_spread: 90,
								camo_detection: true,
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
								camo_detection: true,
								expire_burst_activation: true,
								projectile_burst: [
									{
										sprite: "spr_goo_cube",
										camo_detection: true,
										pierce: 60,
										damage: 1,
										speed: 3,
										friction: 1,
										lifespan: 600,
										tick_frequency: 20,
										image_angle: 0,
										bloon_pushback: 0.03
									}
								]
							}
						]
					}
				],
				upgrade_string: "Puts bloons into goo cubes that block bloons from progressing further into the track. Goo cubes block camo as well."
			},
			"Goo Pool": {
				fire_rate_multiplier: 1.666,
				camo_detection: true,
				range: 20,
				upgrade_string: "Covers the nearby track with a goo pool that causes projectiles to stick to the ground for a long time. Pools pop camo and lead.",
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
								pierce: 100,
								tick_frequency: 120,
								goop: 1,
								goop_time: 180,
								image_angle: 0,
								relative_depth: 30,
								camo_detection: true,
								lead_hit: true
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
								pierce: 100,
								tick_frequency: 120,
								goop: 1,
								goop_time: 180,
								image_angle: 0,
								relative_depth: 30,
								camo_detection: true,
								lead_hit: true
							}
						]
					}
				]
			}
		},
		"caster_monkey": {
			"Pop Markings": {
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_caster_shot",
						projectile_spread: 30,
						projectile_count: 2,
						stay_pointed: true,
						pierce: 3,
						damage: 1,
						speed: 10,
						lifespan: 60,
						spiral_homing_offset: 60,
						homing: true,
						lead_hit: true,
						magic_marking: 1,
						magic_marking_time: 60
					}
				],
				upgrade_string: "Applies a magic mark to bloons, causing them to eat up 1 less pierce when hit."
			},
			"Double Cast": {
				shot_count: 1,
				upgrade_string: "Shoot two cast shots at once"
			},
			"Deep Engravement": {
				range: 20,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_caster_shot",
						projectile_spread: 30,
						projectile_count: 2,
						stay_pointed: true,
						pierce: 13,
						damage: 1,
						speed: 10,
						lifespan: 75,
						spiral_homing_offset: 60,
						homing: true,
						lead_hit: true,
						magic_marking: 10,
						magic_marking_time: 120
					}
				],
				upgrade_string: "Applies deeper engravement, which causes bloons to eat up 10 less pierce when hit. Also gives +10 pierce to caster shots."
			},
			"Death Spiral": {
				range: 40,
				projectile_replacement: true,
				projectile_stats: [
					{
						sprite: "spr_mega_caster_shot",
						projectile_spread: 30,
						projectile_count: 1,
						stay_pointed: true,
						pierce: 80,
						damage: 1,
						speed: 12,
						lifespan: 180,
						spiral_homing_offset: 85,
						homing: true,
						lead_hit: true,
						magic_marking: 10,
						magic_marking_time: 120,
						extra_shots: [
							{
								sprite: "spr_caster_shot",
								pierce: 3,
								damage: 1,
								speed: 24,
								lifespan: 10,
								lead_hit: true,
								aim_at_target: true,
								shot_frequency: 10,
								magic_marking: 10,
								magic_marking_time: 120,
							}
						]
					}
				],
				upgrade_string: "Shoots a mega caster bolt that spirals around for a long time, and rapidly shoots bolts at bloons."
			}
		},
		"skateboard_monkey": {
			"Littering": {
				upgrade_string: "The skateboarder has zero regard for laws. Drops a banana peel on the track occasionally that knocks bloons back.",
				additional_attacks: [
					{
						delay: 135,
						attack_cooldown: 0,
						range: 99999,
						projectile_stats: [
							{
								sprite: "spr_banana_peel",
								lead_hit: true,
								lifespan: 240,
								speed: 0,
								direction: 0,
								damage: 0,
								pierce: 6,
								bloon_pushback: 0.2
							}
						]
					}
				]
			},
			"Pro Skater": {
				fire_rate_multiplier: 1.5,
				upgrade_string: "Moves through the track and litters 50% faster than normal."
			},
			"Scooter": {
				upgrade_string: "Does double damage and litters twice as often",
				tower_sprite: "spr_scooter_monkey",
				fire_rate_multiplier: 2,
				projectile_replacement: true,
				projectile_stats: [
					{
						object: "obj_stick_to_tower_proj",
						sprite: "spr_scooter_monkey",
						pierce: 1000000,
						damage: 2,
						speed: 0,
						lifespan: 9999
					}
				]
			},
			"Motorbike": {
				upgrade_string: "Moves exceptionally fast and leaves a trail of fire.",
				tower_sprite: "spr_motorbike_monkey",
				additional_attacks: [
					{
						delay: 60,
						attack_cooldown: 0,
						range: 99999,
						projectile_stats: [
							{
								sprite: "spr_banana_peel",
								lead_hit: true,
								lifespan: 240,
								speed: 0,
								direction: 0,
								damage: 0,
								pierce: 6,
								bloon_pushback: 0.2
							}
						]
					},
					{
						delay: 9,
						attack_cooldown: 0,
						range: 99999,
						projectile_stats: [
							{
								sprite: "spr_bloon_on_fire",
								lead_hit: true,
								lifespan: 36,
								speed: 0,
								direction: 0,
								damage: 1,
								fire: 1,
								fire_time: 120,
								pierce: 3
							}
						]
					}
				],
				projectile_replacement: true,
				projectile_stats: [
					{
						object: "obj_stick_to_tower_proj",
						sprite: "spr_skateboard_monkey",
						lead_hit: true,
						pierce: 1000000,
						damage: 3,
						speed: 0,
						lifespan: 9999
					}
				]
			}
		},
	}
}