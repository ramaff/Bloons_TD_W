/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_banana_icon, 0, 816, 4)
draw_text_ext_color(880, 24, global.money, 18, 128, c_black, c_black, c_black, c_black, 1)

draw_sprite(spr_lives_icon, 0, 816, 48)
draw_text_ext_color(880, 64, global.lives, 18, 128, c_black, c_black, c_black, c_black, 1)

draw_text(32, 4, "Round")
draw_text(32, 32, string(global.round) + "/" + string(array_length(global.bloon_sends)))

var _panels = min(4, array_length(global.bloon_sends) - global.round);
var _gap = global.round_gap / 4.5;

for(var _i = 0; _i < _panels; _i++) {
	if global.round < 1 {
		continue	
	}
	var _icon = round_properties[global.round - 1 + _i]
	draw_sprite(asset_get_index(_icon.sprite), _icon.index, 100 + _gap + (80 * _i), 40)
}