/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_mission_ui, 0, 0, 0)

draw_sprite(spr_banana_icon, 0, 816, 4)
draw_text_ext_color(880, 24, global.money, 18, 128, c_black, c_black, c_black, c_black, 1)

//draw_sprite(spr_lives_icon, 0, 816, 48)
//draw_text_ext_color(880, 64, global.lives, 18, 128, c_black, c_black, c_black, c_black, 1)

draw_text(16, 4, "Round")
draw_text(72, 4, string(global.round) + "/" + string(array_length(global.bloon_sends)))
draw_text(16, 32, string(floor(global.total_time / 60)) + ":" + string_delete(string((global.total_time mod 60) / 60), 1, 2))

var _panels = min(5, array_length(global.bloon_sends) - global.round);
var _gap = global.round_gap / 6;
var _xx = 100;

if global.round = 0 {
	_gap = 80;	
}
var _round = max(0, global.round - 1)

for(var _i = 0; _i < _panels; _i++) {
	_xx += 80
	var _icon = round_properties[_round + _i]
	if _icon.count = 2 {
		draw_sprite(asset_get_index(_icon.sprite), _icon.index, _xx + _gap - 4, 28 - 4)
		draw_sprite(asset_get_index(_icon.sprite), _icon.index, _xx + _gap + 4, 28 + 4)
	} else {
		draw_sprite(asset_get_index(_icon.sprite), _icon.index, _xx + _gap, 28)
	}
}