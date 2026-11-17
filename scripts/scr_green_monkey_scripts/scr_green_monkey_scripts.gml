// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawn_flower(){
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
			//no_target: true,
	
			projectile_stats: [
				{
					sprite: "spr_needle", projectile_count: 3, projectile_spread: 120,
					direction: 0, pierce: 1, damage: 1, speed: 8, lifespan: 15
				}
			],	
		}
		var _flower_id = noone;
		// todo find closest 1x1 tile
		//var _coords = scr_get_flower_tile(x - 16, y - 16, tower_stats.range)
		var _coords = scr_get_flower_2x2_tile(x - 16, y - 16, tower_stats.range)
		if _coords != - 1 {
			with instance_create_depth(_coords[0], _coords[1], depth - 1, obj_flower) {
				thorns = 40;
				tower_stats = _tower_stats
				_flower_id = id;
				tower_stats.id = other.tower_stats.id;
				parent_id = other.tower_stats.id;
				if variable_struct_exists(tower_stats, "damage_keys") {
					tower_stats.damage_keys = scr_merge_struct(tower_stats.damage_keys, other.tower_stats.damage_keys)	
				} else {
					tower_stats.damage_keys = variable_clone(other.tower_stats.damage_keys);
				}
			
				with instance_create_depth(x, y, depth, obj_tower_tile) {
					tower_id = _flower_id
					x_offset = x - _flower_id.x;
					y_offet = y - _flower_id.y;
					image_xscale = 0.5;
					image_yscale = 0.5;
				}
			
			}
			variable_struct_set(flowers, _flower_id, _flower_id)
			sun -= 100
		} else if variable_struct_exists(tower_stats.active_upgrades, "Bloonberry Bush") {
			_coords = scr_get_berry_tile(x - 16, y - 16, tower_stats.range)
			if _coords != - 1 {
				var _projectile_stats = [
					{
						sprite: "spr_bloonberry_bush",
						projectile_count: 1,
						projectile_spread: 45,
						direction: random(360),
						pierce: 5,
						damage: 1,
						speed: 0,
						lifespan: 1800,
						camo_detection: true,
						tick_frequency: 1
					}
				]

				_projectile_stats[0].direction = random(360)
				scr_create_tower_projectiles(_projectile_stats, _coords[0] - 15 + random(30), _coords[1] - 15 + random(30), noone, 0, {}, noone, undefined, BASE_ALL_DAMAGE_KEYS);
				sun -= 100
			}
		}
	}
}

function scr_get_berry_tile(_mx, _my, _range) {
	var _start = random(30);
	var _j;
	var _i;
	var _paths = array_length(global.paths)
	for(_i = 0; _i < _paths; _i++) {
		var _path = global.paths[_i];
		for(_j = 0; _j < 30; _j++) {
			var _per = ((_start + _j) / 30) mod 30
			var _xx = path_get_x(_path, _per)
			var _yy = path_get_y(_path, _per)
			if point_distance(_xx, _yy, _mx, _my) < _range {
				return [_xx, _yy]
			}
		}
	}
	return -1
}

function scr_get_flower_2x2_tile(_mx, _my, _range) {
	// go outwards to find nearest tile in range
	// check 1 tile away from center, then increase tile distance
	var _xx = 0
	var _yy = 0
	var _xs = 32
	var _ys = 32
	repeat(20) {
		for(_xx = -_xs; _xx < _xs; _xx += 32) {
			for(_yy = -_ys; _yy < _ys; _yy += 32) {
				if point_distance(_xx, _yy, 0, 0) > _range {
					continue	
				}
				var _path_collide_obj = collision_point(_mx + _xx, _my + _yy, obj_non_placeable_tile, false, false)
				if !_path_collide_obj {
					return [_mx + _xx, _my + _yy]
				}
			}
		}
		_xs += 32
		_ys += 32
		if _xs > _range {
			return -1	
		}
	}
}

function scr_get_flower_tile(_mx, _my, _range) {
	// go outwards to find nearest tile in range
	// check 1 tile away from center, then increase tile distance
	var _xx = 0
	var _yy = 0
	var _xs = 32
	var _ys = 32
	repeat(20) {
		for(_xx = -_xs; _xx < _xs; _xx += 16) {
			for(_yy = -_ys; _yy < _ys; _yy += 16) {
				if point_distance(_xx, _yy, 0, 0) > _range {
					continue	
				}
				var _path_collide_obj = collision_point(_mx + _xx, _my + _yy, obj_non_placeable_tile, false, false)
				if !_path_collide_obj {
					return [_mx + _xx, _my + _yy]
				}
			}
		}
		_xs += 16
		_ys += 16
		if _xs > _range {
			return -1	
		}
	}
}

function scr_sun() {
	if sun < 100 {
		sun += 5	
	}
}

function scr_venus_bloon_consume() {
	if instance_exists(projectile_stats.tower_id) {
		projectile_stats.tower_id.sun += 1
	}	
}