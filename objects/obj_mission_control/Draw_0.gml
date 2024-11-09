/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_mission_ui, 0, 0, 0)

draw_sprite(spr_banana_icon, 0, 816, 4)
draw_text_ext_color(880, 24, floor(global.money), 18, 128, c_black, c_black, c_black, c_black, 1)

//draw_sprite(spr_lives_icon, 0, 816, 48)
//draw_text_ext_color(880, 64, global.lives, 18, 128, c_black, c_black, c_black, c_black, 1)

scr_draw_outline_text(16, 4, "Round")
scr_draw_outline_text(72, 4, string(global.round) + "/" + string(array_length(global.bloon_sends)))
scr_draw_outline_text(16, 32, scr_timer_string(global.total_time))

var _panels = min(5, array_length(global.bloon_sends) - global.round);
var _gap = global.round_gap / 6;
var _xx = 100;

if global.round = 0 {
	_gap = 80;	
}
var _round = max(-1, global.round - 1)

for(var _i = 0; _i < _panels; _i++) {
	_xx += 80
	var _icon = round_properties[_round + _i + 1]
	if _icon.count = 2 {
		draw_sprite(asset_get_index(_icon.sprite), _icon.index, _xx + _gap - 4, 28 - 4)
		draw_sprite(asset_get_index(_icon.sprite), _icon.index, _xx + _gap + 4, 28 + 4)
	} else {
		draw_sprite(asset_get_index(_icon.sprite), _icon.index, _xx + _gap, 28)
	}
}