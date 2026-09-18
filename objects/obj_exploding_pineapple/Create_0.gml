var _projectile_stats = [
	{
		object: "obj_no_hit",
		sprite: "spr_timed_pineapple",
		lead_hit: true,
		pierce: 60,
		damage: 1,
		speed: 0,
		direction: 0,
		lifespan: 90,
		image_angle: 0,
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

scr_create_tower_projectiles(_projectile_stats, x, y, noone, 0, {}, noone);

instance_destroy()
