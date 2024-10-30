/// @description Insert description here
// You can write your code in this editor

var _xx = x;
var _yy = y;
var _visible = true;

with(obj_bloon) {
	if object_get_name(object_index) != "obj_peek_a_bloon" {
		if distance_to_point(_xx, _yy) < 125 {
			_visible = false;
		}
	}
}

if _visible = false {
	image_alpha = lerp(image_alpha, 0, 0.05);
} else {
	image_alpha = lerp(image_alpha, 1, 0.8);
}

if image_alpha = 0 {
	alarm[0] = 10;	
} else {
	alarm[0] = 1;	
}



