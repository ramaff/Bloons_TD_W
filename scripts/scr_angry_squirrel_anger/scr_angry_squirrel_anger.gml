// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_angry_squirrel_anger(_tower_stats = tower_stats) {

	var _anger_boost = {
		fire_rate_boost_multiplier: 5,
		range_boost: 60,
		boost_duration: 360,
		sprite: "spr_angry_squirrel_angry",
		sprite_priority: 2,
		stun_heal_fac: 5
	}
	if !variable_struct_exists(_tower_stats, "stat_boosts") {
		_tower_stats.stat_boosts = {}
	}
	if variable_struct_exists(_tower_stats, "active_upgrades") {
		/*if variable_struct_exists(_tower_stats.active_upgrades, "Anger Mismanagement") {
			_anger_boost.boost_duration = _anger_boost.boost_duration * 2;
		} */
		if variable_struct_exists(_tower_stats.active_upgrades, "Venting") {
			if !variable_struct_exists(_tower_stats.stat_boosts, "angry_boost") {
				_tower_stats.health += floor(_tower_stats.max_health / 20);
				if _tower_stats.health > _tower_stats.max_health {
					_tower_stats.health = _tower_stats.max_health	
				}
			}
		}
		if variable_struct_exists(_tower_stats.active_upgrades, "Acorn Assault") {
			_anger_boost.shot_count = 2;
		}
		if variable_struct_exists(_tower_stats.active_upgrades, "Lingering Flame") {
			_anger_boost.fire_rate_boost_multiplier = _anger_boost.fire_rate_boost_multiplier / 1.5
			var _lingering_flame_boost = {
				fire_rate_boost_multiplier: 2,
				boost_duration: 1200,
				range_boost: 15,
				sprite: "spr_angry_squirrel_lingering_flame",
				sprite_priority: 1,
				stun_heal_fac: 2
			}
			if variable_struct_exists(_tower_stats.active_upgrades, "Acorn Assault") {
				_lingering_flame_boost.shot_count = 1;
				_lingering_flame_boost.shot_spread = 45;
				_lingering_flame_boost.alternating_angular_velocity = 5;
			}
			variable_struct_set(_tower_stats.stat_boosts, "lingering_flame", _lingering_flame_boost)
		}
		if variable_struct_exists(_tower_stats.active_upgrades, "Instigator") {
			if !variable_struct_exists(_tower_stats.stat_boosts, "angry_boost") {
				var _instigation = {
					boost_duration: 180,
				}
				variable_struct_set(_tower_stats.stat_boosts, "instigation", _instigation)
			}
		}
		if variable_struct_exists(_tower_stats.active_upgrades, "Rampage") {
			if !variable_struct_exists(_tower_stats.stat_boosts, "angry_boost") {
				
				var _target = noone
				var _min_dist = 200

				with(obj_monkey) {
					var _dist = distance_to_object(other)
					if id != other.id {
						if _dist < _min_dist and stun <= 0 {
							_target = id;
							_min_dist = _dist
						}
					}
				}
				
				var _dir = 0;

				with(_target) {
					_dir = point_direction(x, y, other.x, other.y) + 180;
					with instance_create_depth(x, y, depth, obj_tower_collider) {
						speed = 30;
						direction = _dir
						alarm[0] = 300;
						target = _target
						start_x = x;
						start_y = y;
						//sprite_index = _target.sprite_index
					}
				}
				
				if _target != noone {
					
					var _damage_keys = []
					if variable_struct_exists(tower_stats, "damage_keys") {
						_damage_keys = tower_stats.damage_keys	
					}
					
					var _projectile_stats = [{
						object: "obj_stick_to_tower_proj",
						sprite: sprite_get_name(_target.sprite_index),
						size: 1.5,
						pierce: 1000000,
						damage: 50,
						speed: 0,
						lifespan: 300,
						tick_frequency: 5,
						tower_stick_id: _target.id
					}]

					scr_create_tower_projectiles(_projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)
					
					_tower_stats.health += floor(_tower_stats.max_health / 20);
					if _tower_stats.health > _tower_stats.max_health {
						_tower_stats.health = _tower_stats.max_health	
					}
				}
			}
		}
	}
	//var _boost_length = array_length(_tower_stats.stat_boosts)
	
	variable_struct_set(_tower_stats.stat_boosts, "angry_boost", _anger_boost)
	//_tower_stats.stat_boosts.angry_boost = _anger_boost

}