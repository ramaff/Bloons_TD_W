
var _projectile_stats = [
	{
		sprite: "spr_road_spike",
		projectile_count: 1,
		projectile_spread: 45,
		direction: random(360),
		pierce: 1,
		damage: 1,
		speed: 0,
		lifespan: 99999,
		camo_detection: true
	}
]

repeat(10) {
	_projectile_stats[0].direction = random(360)
	scr_create_tower_projectiles(_projectile_stats, x, y, noone, 0, {}, noone);
}

instance_destroy()