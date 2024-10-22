/// @description Insert description here
// You can write your code in this editor

if !hero_placed {
	draw_self();
} else {
	if instance_exists(hero_id) {
		var _hp_percent = hero_id.tower_stats.health / hero_id.tower_stats.max_health
		var _xx_offset = 32 + (96 * _hp_percent);
		draw_sprite_part(spr_hero_hp, 0, 0, 0, _xx_offset, 64, x, y)
		draw_sprite(spr_hero_hp, 1, x, y)
		scr_draw_outline_text(x+ 64, y+18, string(hero_id.tower_stats.health))
	}
}





