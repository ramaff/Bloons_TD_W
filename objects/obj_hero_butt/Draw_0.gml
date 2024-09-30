/// @description Insert description here
// You can write your code in this editor

if !hero_placed {
	draw_self();
} else {
	show_debug_message(hero_id)
	if instance_exists(hero_id) {
		draw_text(x, y, string(hero_id.tower_stats.health) + "/" + string(hero_id.tower_stats.max_health))	
	}
}





