// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_set_camo(_bloon){
	
	var _class = _bloon.bloon_stats.class
	var _layer = _bloon.bloon_stats.layer
	
	_bloon.bloon_stats.sprite = "spr_camo_bloon"
	if _class = "splitter" {
		_bloon.bloon_stats.sprite = "spr_camo_splitter_bloon"
	}
	if _class = "ceramic" and _layer = "ceramic" {
		_bloon.bloon_stats.sprite = "spr_camo_ceramic_bloon"
	}
	if _class = "ceramic" and _layer = "brick" {
		_bloon.bloon_stats.sprite = "spr_camo_brick_bloon"
	}
	_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.sprite);
}