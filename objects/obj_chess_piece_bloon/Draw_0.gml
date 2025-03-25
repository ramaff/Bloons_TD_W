/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
draw_self()

/*if !activated {
	exit;	
} */

if bloon_stats.health < bloon_stats.max_health {
	var _xx_offset = 40 + (84 * (bloon_stats.health / bloon_stats.max_health))

	var _yy = sprite_get_height(sprite_index) / 4

	draw_sprite_part(spr_bounty_hp, 0, 0, 0, _xx_offset, 64, x - 64, y + _yy)
	draw_sprite(spr_bounty_hp, 1, x - 64, y + _yy)
}