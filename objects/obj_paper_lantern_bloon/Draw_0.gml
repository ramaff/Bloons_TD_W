/// @description Insert description here
// You can write your code in this editor

var _indexes = sprite_get_number(sprite_index)
image_index = _indexes - ceil(_indexes * (bloon_stats.health / bloon_stats.max_health))

draw_sprite(spr_shadow, 0, x, y + 10)

draw_self()





