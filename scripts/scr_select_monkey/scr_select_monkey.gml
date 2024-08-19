// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_select_monkey(){
	
	with instance_create_depth(800, 104, depth, obj_upgrade_butt) {
		
		selected_monkey = other.id;
		
		upgrade_stats = json_parse(json_stringify(other.tower_stats));
		
		upgrade_stats.upgrade_cost = upgrade_stats.total_cost * 0.4;
		upgrade_stats.upgrade_cost = round(upgrade_stats.upgrade_cost / 10) * 10
		for(var _i = 0; _i < array_length(upgrade_stats.projectile_stats); _i++) {
		
			upgrade_stats.projectile_stats[_i].pierce = upgrade_stats.projectile_stats[_i].pierce * 2
		
		}
		
		upgrade_string = "Increase the pierce of the monkey by " + string(upgrade_stats.projectile_stats[0].pierce / 2)
		
	}
	
	with instance_create_depth(800, 264, depth, obj_upgrade_butt) {
		
		selected_monkey = other.id;
		
		upgrade_stats = json_parse(json_stringify(other.tower_stats));
		
		upgrade_stats.upgrade_cost = upgrade_stats.total_cost * 0.6;
		upgrade_stats.upgrade_cost = round(upgrade_stats.upgrade_cost / 10) * 10
		upgrade_stats.delay = upgrade_stats.delay / 1.66;
		
		upgrade_string = "Makes the monkey shoot 66% faster"
		
	}
	
	with instance_create_depth(800, 424, depth, obj_upgrade_butt) {
		
		selected_monkey = other.id;
		
		upgrade_stats = json_parse(json_stringify(other.tower_stats));
		
		upgrade_stats.upgrade_cost = upgrade_stats.total_cost * 0.75;
		upgrade_stats.upgrade_cost = round(upgrade_stats.upgrade_cost / 10) * 10
		
		var _proj_count = array_length(upgrade_stats.projectile_stats)
		
		for(var _i = _proj_count; _i < _proj_count * 2; _i++) {
		
			upgrade_stats.projectile_stats[_i] = upgrade_stats.projectile_stats[0]
		
		}
		
		upgrade_string = "Makes the monkey throw twice as many darts"
		
	}
	
}