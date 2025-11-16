// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_apply_damage_to_bloon(_bloon_stats, _damage, _round, _bloon = noone, _tower = noone) {
	var _resulting_bloons = []
	_damage = max(0, _damage)
	if instance_exists(_tower) {
		_tower.pop_count += min(_damage, _bloon_stats.health)
	}
	_bloon_stats.health -= _damage
	
	//show_debug_message("bloon stats:" + string(_bloon_stats))
	
	if _bloon_stats.health <= 0 {
		
		var _cash_sucked = false 
		var _cash_flow = 1;
		
		if instance_exists(obj_real_estate_bloon) {
			var _ogxx = x;
			var _ogyy = y
			with (obj_real_estate_bloon) {
				if point_distance(x, y, _ogxx, _ogyy) < 200 {
					_cash_flow = 0
					capital++;
					//with instance_create_depth(x - 100 + random(200), y - 100 + random(200), -100, obj_text) {
					//	text = "+1 tax collected";
					//}
				}
			}
		}
		
		if _round > 40 {
			_cash_flow = _cash_flow * 0.2;
		} else if _round > 30 {
			_cash_flow = _cash_flow * 0.4;
		} else if _round > 20 {
			_cash_flow = _cash_flow * 0.6;
		}
		
		//if !_cash_sucked {
		if _bloon_stats.remaining_value > 0 {
			var _gimme = min(_cash_flow, _cash_flow * _bloon_stats.remaining_value)
			global.money += _gimme
			if instance_exists(obj_bongo_monkey) and _gimme > 0 {
				var _ogxx = x;
				var _ogyy = y
				if random(2 / _gimme) <= 1 {
					with (obj_bongo_monkey) {
						if point_distance(x, y, _ogxx, _ogyy) < tower_stats.range {
							global.money += _gimme / 2
							with instance_create_depth(x - 10 + random(20), y - 10 + random(20), depth - 10, obj_text) {
								text = "+$1";
							}
							break;
						}
					}
				}
			}
		}
		//}

		_bloon_stats.remaining_value--;
		if instance_exists(_tower) {
			_tower.pop_count++;
		}
		
		var _children = []
		if variable_struct_exists(_bloon_stats, "children") {
			_children = _bloon_stats.children
		}
		
		var _remaining_damage = 0 - _bloon_stats.health
		var _children_count = array_length(_children)
		
		for(var _i = 0; _i < _children_count; _i++) {
			var _layer = variable_struct_get(_children[_i], "layer")
			var _child_class = variable_struct_get(_children[_i], "class")
			
			var _class_stats = struct_get(global.bloon_stats, _child_class)
			var _child_stats = variable_clone(struct_get(_class_stats, _layer))
			
			_child_stats.layer = _layer
			_child_stats.class = _child_class
			_child_stats.properties = []
			if variable_struct_exists(_children[_i], "properties") {
				_child_stats.properties = variable_struct_get(_children[_i], "properties")
			}
			_child_stats.properties = array_concat(_child_stats.properties, _bloon_stats.properties)
			_child_stats.remaining_value = _bloon_stats.remaining_value / array_length(_children)
			
			var _promotable = {
				"normal": true,
				"splitter": true,
				"ceramic": true,
				"lead": true,
				"peek-a-bloon": true
			}
			
			if variable_struct_exists(_promotable, _bloon_stats.class) {
				if !variable_struct_exists(_bloon_stats, "parents") {
					_child_stats.parents = [
						{
							"class": _bloon_stats.class,
							"layer": _bloon_stats.layer,
						}
					]
				} else {
					_bloon_stats.parents[array_length(_bloon_stats.parents)] = {
						"class": _bloon_stats.class,
						"layer": _bloon_stats.layer
					}
					_child_stats.parents = variable_clone(_bloon_stats.parents)
				}
			}
			
			//show_debug_message("child stats:" + string(_child_stats))
			if variable_struct_exists(_bloon_stats, "tattered") {
				var _index = array_get_index(_child_stats.properties, "tattered")
				if _index != -1 {
					array_delete(_child_stats.properties, _index, 1)
				}
			}
			if variable_struct_exists(_bloon_stats, "metallic") {
				var _index = array_get_index(_child_stats.properties, "metallic")
				if _index != -1 {
					array_delete(_child_stats.properties, _index, 1)
				}
			}
			
			if variable_struct_exists(_bloon_stats, "shielded") {
				var _index = array_get_index(_child_stats.properties, "shielded")
				if _index != -1 {
					array_delete(_child_stats.properties, _index, 1)
				}
			}
			
			_resulting_bloons = array_concat(_resulting_bloons, 
											 scr_apply_damage_to_bloon(_child_stats, _remaining_damage, _round, noone, _tower))
		}
	} else if _bloon = noone {
		return [_bloon_stats]	
	}
	
	return _resulting_bloons
}

function scr_bloon_hit(_bloon = other, _class = "normal", _projectile_stats = projectile_stats, _projectile = noone) {
	
	var _pos = _bloon.path_position
	var _parent_id = _bloon.parent_id
	
	var _xx = _bloon.x
	var _yy = _bloon.y
	
	var _tower = noone;
	if variable_struct_exists(_projectile_stats, "tower_id") {
		_tower = _projectile_stats.tower_id
	}
	
	if instance_exists(obj_lawyer_bloon) {
		if _bloon.path_position < 0.33 {
			exit;	
		}
	}
	if instance_exists(obj_the_high_court_control) {
		if instance_exists(_tower) {
			if variable_struct_exists(obj_the_high_court_control.blocked_towers, string(_tower.id)) {	
				exit;
			}
		}
	}
	
	if variable_struct_exists(_bloon.bloon_stats, "shielded") {
		if _bloon.bloon_stats.shielded {
			_bloon.bloon_stats.shield_health -= _projectile_stats.damage
			if _bloon.bloon_stats.shield_health < 1 {
				_bloon.bloon_stats.shielded = false
				_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.sprite);
			}
			_projectile_stats.pierce -= 10;
			if _projectile_stats.pierce <= 0 {
				if instance_exists(_projectile) {
					instance_destroy(_projectile)
				}
			}
			exit;
		}
	}
	
	var _stopped_by_lead = false;
	if variable_struct_exists(_bloon.bloon_stats, "metallic") {
		if _bloon.bloon_stats.metallic {
			_stopped_by_lead = true;
			if variable_struct_exists(_projectile_stats, "lead_hit") {
				if _projectile_stats.lead_hit {
					_stopped_by_lead = false;
				}
			}
		}
	}
	if variable_struct_exists(_bloon.bloon_stats, "freeze") {
		if _bloon.bloon_stats.freeze {
			_stopped_by_lead = true;
			if variable_struct_exists(_projectile_stats, "lead_hit") {
				if _projectile_stats.lead_hit {
					_stopped_by_lead = false;
				}
			}
		}
	}
	if _stopped_by_lead {
		if instance_exists(_projectile) {
			instance_destroy(_projectile)
		}
		exit;
	}
	
	if variable_struct_exists(_projectile_stats, "freeze")  {
		_bloon.bloon_stats.freeze = _projectile_stats.freeze;
		_bloon.bloon_stats.freeze_time = _projectile_stats.freeze_time;
	}
	if variable_struct_exists(_projectile_stats, "goop") {
		_bloon.bloon_stats.goop = _projectile_stats.goop;
		_bloon.bloon_stats.goop_time = _projectile_stats.goop_time;
	}
	if variable_struct_exists(_projectile_stats, "fire") {
		_bloon.bloon_stats.fire = _projectile_stats.fire;
		_bloon.bloon_stats.fire_time = _projectile_stats.fire_time;
		_bloon.bloon_stats.fire_og_tower_id = _projectile_stats.tower_id;
	}
	if variable_struct_exists(_projectile_stats, "paint") {
		_bloon.bloon_stats.paint = _projectile_stats.paint;
		_bloon.bloon_stats.paint_time = _projectile_stats.paint_time;
		if variable_struct_exists(_bloon.bloon_stats, "camo") {
			variable_struct_remove(_bloon.bloon_stats, "camo")
			var _index = array_get_index(_bloon.bloon_stats.properties, "camo")
			if _index != -1 {
				array_delete(_bloon.bloon_stats.properties, _index, 1)
			}
			
			_bloon.bloon_stats.camo_paint_over = true;
			_bloon.bloon_stats.sprite = "spr_bloon"
			if _class = "splitter" {
				_bloon.bloon_stats.sprite = "spr_splitter_bloon"
			}
			if _class = "ceramic" and _bloon.bloon_stats.layer = "ceramic" {
				_bloon.bloon_stats.sprite = "spr_ceramic_bloon"
			}
			if _class = "ceramic" and _bloon.bloon_stats.layer = "brick" {
				_bloon.bloon_stats.sprite = "spr_brick_bloon"
			}
			_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.sprite);
		}
		if variable_struct_exists(_bloon.bloon_stats, "tattered") {
			_bloon.bloon_stats.tattered_paint_over = true;
			variable_struct_remove(_bloon.bloon_stats, "tattered")
			var _index = array_get_index(_bloon.bloon_stats.properties, "tattered")
			if _index != -1 {
				array_delete(_bloon.bloon_stats.properties, _index, 1)
			}
			
			_bloon.bloon_stats.speed = _bloon.bloon_stats.speed * 0.5
			_bloon.speed = _bloon.bloon_stats.speed
			_bloon.path_speed = _bloon.speed
		}
		if variable_struct_exists(_projectile_stats, "make_over") and !variable_struct_exists(_bloon.bloon_stats, "make_over") {
			if _bloon.bloon_stats.big_bloon_tier <= 2 {
				var _target_layer = _projectile_stats.targeting
				var _class_stats = struct_get(global.bloon_stats, _class)
				if variable_struct_exists(_class_stats, _target_layer) {
					scr_bloon_stat_setup(_bloon, _class, _target_layer, _bloon.bloon_stats.path, _bloon.bloon_stats.properties, _bloon.bloon_stats.round, _xx, _yy)
		
					if instance_exists(target) {
						target.path_position = _pos;
						target.x = path_get_x(_bloon.bloon_stats.path, _pos);
						target.y = path_get_y(_bloon.bloon_stats.path, _pos);
					} else if path_index != -1 {
						path_position = _pos;
						path_speed = _bloon.bloon_stats.speed;
						speed = _bloon.bloon_stats.speed;
						x = _xx
						y = _yy
					}
				}
				variable_struct_set(_bloon.bloon_stats, "make_over", _target_layer)
			}
			// need to also set up the health if a bloon gets swapped (or not idk whatever)
		}
	}
	
	var _damage = _projectile_stats.damage;
	var _density = _bloon.bloon_stats.density;
	
	if variable_struct_exists(_bloon.bloon_stats, "magic_marking") {
		_density = max(0, _density - _bloon.bloon_stats.magic_marking);
	}
	
	if variable_struct_exists(_projectile_stats, "magic_marking") {
		if !variable_struct_exists(_bloon.bloon_stats, "magic_marking") {
			_bloon.bloon_stats.magic_marking = 0;
		}
		if _projectile_stats.magic_marking >= _bloon.bloon_stats.magic_marking {
			_bloon.bloon_stats.magic_marking = _projectile_stats.magic_marking;
			_bloon.bloon_stats.magic_marking_time = _projectile_stats.magic_marking_time;
		}
	}
	
	if _damage * _projectile_stats.pierce < _density and _damage > 0 {
		if instance_exists(_projectile) {
			instance_destroy(_projectile)
		}
		exit;
	}
	
	_projectile_stats.pierce -= _density;
	
	var _resulting_bloons = scr_apply_damage_to_bloon(_bloon.bloon_stats, _damage, _bloon.bloon_stats.round, _bloon, _tower)
	
	//show_debug_message(array_length(_resulting_bloons))
	
	if array_length(_resulting_bloons) == 0 {
		if variable_struct_exists(_bloon.bloon_stats, "zombie_stats") {
			with instance_create_depth(_xx, _yy, depth, obj_bloon_tombstone) {
				bloon_stats = _bloon.bloon_stats.zombie_stats
				path_position = _pos
			}
		}	
	}
	
	if _class = "stuffed" {
		_pos = _pos * 1.2;
	}

	for(var _i = 0; _i < array_length(_resulting_bloons); _i++) {
		var _layer = variable_struct_get(_resulting_bloons[_i], "layer")
		var _child_class = variable_struct_get(_resulting_bloons[_i], "class")
		var _child_properties = variable_struct_get(_resulting_bloons[_i], "properties")
		var _child_remaining_value = variable_struct_get(_resulting_bloons[_i], "remaining_value")
		
		var _bloon_object = scr_bloon_class_to_object(_child_class);
		
		var _child_path = _bloon.bloon_stats.path
		if variable_struct_exists(_bloon.bloon_stats, "child_path") {
			if _bloon.bloon_stats.child_path = -1 {
				_child_path = global.paths[irandom(array_length(global.paths) - 1)]
			} else {
				_child_path = _bloon.child_path	
			}
		}

		with instance_create_depth(_xx, _yy, depth, _bloon_object) {
			scr_bloon_stat_setup(id, _child_class, _layer, _child_path, _child_properties, _bloon.bloon_stats.round)
			
			path_position = _pos
			if variable_struct_exists(_bloon.bloon_stats, "stay_floating") {
				path_end()
				path_position = 0;
				x = _xx;
				y = _yy;
				speed = 0;
			} else {
				if _bloon.bloon_stats.path != -1 {
					x = path_get_x(_bloon.bloon_stats.path, path_position);
					y = path_get_y(_bloon.bloon_stats.path, path_position);
				}
			}
			parent_id = _parent_id
			_pos -= 0.01
			
			//show_debug_message("resulting bloon stats:" + string(_resulting_bloons[_i]))
			
			if variable_struct_exists(_resulting_bloons[_i], "parents") {
				bloon_stats.parents = _resulting_bloons[_i].parents	
			}
			
			if _child_class = "zombie" {
				if _i = 0 and variable_struct_exists(_bloon.bloon_stats, "zombie_stats") {
					bloon_stats.zombie_stats = _bloon.bloon_stats.zombie_stats
				} else {
					variable_struct_remove(bloon_stats, "zombie_stats")	
				}
			}
			if variable_struct_exists(_bloon.bloon_stats, "goop") {
				bloon_stats.goop = _bloon.bloon_stats.goop;
				bloon_stats.goop_time = _bloon.bloon_stats.goop_time;
			}
			if variable_struct_exists(_bloon.bloon_stats, "fire") {
				bloon_stats.fire = _bloon.bloon_stats.fire;
				bloon_stats.fire_time = _bloon.bloon_stats.fire_time;
				bloon_stats.fire_og_tower_id = _bloon.bloon_stats.fire_og_tower_id;
			}
			if variable_struct_exists(_bloon.bloon_stats, "magic_marking") {
				bloon_stats.magic_marking = _bloon.bloon_stats.magic_marking;
				bloon_stats.magic_marking_time = _bloon.bloon_stats.magic_marking_time;
			}
			if variable_struct_exists(_bloon.bloon_stats, "paint") {
				bloon_stats.paint = _bloon.bloon_stats.paint;
				if variable_struct_exists(_bloon.bloon_stats, "camo_paint_over") {
					bloon_stats.camo_paint_over = _bloon.bloon_stats.camo_paint_over;
				}
				if variable_struct_exists(_bloon.bloon_stats, "tattered_paint_over") {
					bloon_stats.tattered_paint_over = _bloon.bloon_stats.tattered_paint_over;
				} 
				bloon_stats.paint_time = _bloon.bloon_stats.paint_time;
			}
			if variable_struct_exists(_bloon.bloon_stats, "make_over") {
				bloon_stats.make_over = _bloon.bloon_stats.make_over;
			}
			
			bloon_stats.projectile_hits = variable_clone(_bloon.bloon_stats.projectile_hits)
			bloon_stats.remaining_value = _child_remaining_value;
			
			alarm[0] = _bloon.alarm[0];
			if alarm[0] > 90 {
				alarm[0] = 90;	
			}
			
			if instance_exists(target) {
				target.path_position = _pos	
				if _bloon.bloon_stats.path != -1 {
					target.x = path_get_x(_bloon.bloon_stats.path, path_position);
					target.y = path_get_y(_bloon.bloon_stats.path, path_position);
				}
				
				x = _xx;
				y = _yy
			}
			
			image_index = bloon_stats.index
		}
	}
	
	if _bloon.bloon_stats.health <= 0 {
		instance_destroy(_bloon)
		instance_create_depth(_xx, _yy, depth - 10, obj_pop)
		scr_play_sound(choose(pop1, pop2, pop3, pop4))
		exit;
	}
	
	if variable_struct_exists(_projectile_stats, "puncture") {
		if _projectile_stats.puncture > 0 {
			with instance_create_depth(x, y, _bloon.depth - 1, obj_puncture) {
				target = _bloon.id;
				puncture = _projectile_stats.puncture
				image_angle = random(360);
				og_proj_tower_id = _tower;
			}
		}
	}

}