// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawn_flower(){
	if global.round > 0 {
		scr_sun()
		if sun >= 100 {
			var _tower_stats = {
				tower_sprite: "spr_flower",
				total_cost: 660,
				upgrade_cost: 0,
				range: 90,
				delay: 60,
				attack_cooldown: 0,
				attack_angle_offset: 0,
				no_target: true,
	
				projectile_stats: [
					{
						sprite: "spr_needle", projectile_count: 3, projectile_spread: 120,
						direction: 0, pierce: 1, damage: 1, speed: 8, lifespan: 15, height: 4,
						lobbing: {gravity: 0.5, speed: 3.5}
					}
				],	
			}
			var _flower_id = noone;
			// todo find closest 1x1 tile
			var _xx = x - 20 + random(40);
			var _yy = y - 20 + random(40);
			with instance_create_depth(_xx, _yy, depth - 1, obj_flower) {
				thorns = 100;
				tower_stats = _tower_stats
				_flower_id = id;
				tower_stats.id = other.tower_stats.id;
				parent_id = other.tower_stats.id;
				if variable_struct_exists(tower_stats, "damage_keys") {
					tower_stats.damage_keys = scr_merge_struct(tower_stats.damage_keys, other.tower_stats.damage_keys)	
				} else {
					tower_stats.damage_keys = variable_clone(other.tower_stats.damage_keys);
				}
			}
			variable_struct_set(flowers, _flower_id, _flower_id)
			sun -= 100
		}
	}
}

function scr_sun() {
	sun += 10
}