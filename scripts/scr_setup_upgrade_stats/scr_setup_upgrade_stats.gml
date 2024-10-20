// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_upgrade_stats(){
	return {
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
				upgrade_attack_script: scr_pineapple_juggling,
				projectile_replacement: true,
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
						no_target: true,
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
						no_target: true,
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