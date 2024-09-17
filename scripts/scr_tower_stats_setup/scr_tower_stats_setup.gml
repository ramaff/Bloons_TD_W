// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tower_stats_setup(){
	global.tower_stats = {
		"jim": {
			total_cost: 250,
			upgrade_cost: 0,
			range: 140,
			delay: 30,
			attack_cooldown: 0,
	
			projectile_stats: [
				{
					sprite: "spr_dart",
					pierce: 1,
					damage: 1,
					speed: 12,
					lifespan: 30
				}
			]
		},
		"sling_monkey": {
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
					speed: 12,
					lifespan: 30
				}
			]
		}
	}
}