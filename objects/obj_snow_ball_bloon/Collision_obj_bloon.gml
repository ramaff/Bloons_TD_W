

if variable_struct_exists(banned, other.bloon_stats.class) {
	var _banned_class = variable_struct_get(banned, other.bloon_stats.class)
	if variable_struct_exists(_banned_class, other.bloon_stats.layer) {
		exit;	
	}
}

scr_snow_ball_consume_bloon()

