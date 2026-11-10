function scr_spawn_orbital_bloon(_xx, _yy, _target, _class, _layer, _dist, _ang){
	with instance_create_depth(_xx, _yy, depth, obj_orbital_bloon) {
		scr_bloon_stat_setup(id, _class, _layer, -1, ["orbital"], -1)
		speed = bloon_stats.speed;

		target = _target
		bloon_stats.remaining_value = 0;
		orbit_distance = _dist;
		orbit_angle = _ang;
	}
}