/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
var _indexes = sprite_get_number(sprite_index)
image_index = _indexes - ceil(_indexes * (bloon_stats.health / bloon_stats.max_health))

event_inherited()