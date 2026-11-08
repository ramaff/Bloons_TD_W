function scr_particle_burst(_count, _area, _sprite, _life){
	repeat(_count) {
		var _xxx = random(_area) - (_area / 2);
		var _yyy = random(_area) - (_area / 2);
		with instance_create_depth(x + _xxx, y + _yyy, depth, obj_particle) {
			alarm[0] = _life;
			sprite_index = _sprite
		}
	}
}