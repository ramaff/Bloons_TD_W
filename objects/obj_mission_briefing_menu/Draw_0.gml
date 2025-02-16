/// @description Insert description here
// You can write your code in this editor

draw_self()

var _track_sprite_name = "spr_" + track_name + "_track"
_track_sprite_name = string_replace(_track_sprite_name, "rm_", "")

//show_debug_message(_track_sprite_name)
draw_sprite_ext(asset_get_index(_track_sprite_name), 0, 40, 200, 0.5, 0.5, 0, image_blend, image_alpha);




