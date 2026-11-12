function scr_split_projectile_bad(){
	projectile_stats.damage = projectile_stats.damage / 2;
	projectile_stats.size = projectile_stats.size / 1.4;
	image_xscale = image_xscale / 1.4;
	image_yscale = image_yscale / 1.4;
	alarm[0] = alarm[0] / 2;
	var _proj = instance_copy(false)
	if image_angle = direction {
		image_angle -= 75;	
	}
	direction -= 75;
	if _proj.image_angle = _proj.direction {
		_proj.image_angle += 75;	
	}
	_proj.direction += 75;
}