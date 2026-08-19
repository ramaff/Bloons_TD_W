function scr_create_pause_decoy(_sprite_index, _image_index){
	with instance_create_depth(x, y, depth, obj_pause_decoy) {
		sprite_index = _sprite_index
		image_index = _image_index
		
		image_blend = c_gray
	}
}