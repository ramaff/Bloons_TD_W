/// @description Insert description here
// You can write your code in this editor


target = scr_get_bloon_target(tower_stats, x, y, targeting, range_boost)
//var _ang = random(360);

if instance_exists(target) and tower_stats.barrage_count = 0 and (tower_stats.attack_cooldown - tick_down) <= 0 {
	event_user(0)
}

// Inherit the parent event
event_inherited();

/*if !attacked and tower_stats.barrage_count <= 0 {
	x = og_x;
	y = og_y;
} */