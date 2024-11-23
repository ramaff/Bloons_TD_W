/// @description Insert description here
// You can write your code in this editor
tower_stats = {
	total_cost: 200,
	upgrade_cost: 0,
	range: 140,
	delay: 30,
	attack_cooldown: 0,
	tower_sprite: "spr_monkey",
	projectile_stats: [
		{
			sprite: "spr_dart",
			pierce: 2,
			damage: 1,
			speed: 10,
			lifespan: 40
		}
	],
	stat_boosts: {},
	abilities: {
		"Power Dart": {
			"charge_time": 30,
			"cooldown": 0,
			"max_charges": 1,
			"charges": 0
		}
	},
	upgrades: [
		[
			{
				keyword: "darter",
				upgrade_cost: 200
			}
		]
	],
	active_upgrades: {}
}

all_bases = false
stun = 0;
targeting = "first";
pop_count = 0;
attacked = false;

alarm[0] = 60;