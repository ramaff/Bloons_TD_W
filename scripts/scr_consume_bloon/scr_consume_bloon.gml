function scr_consume_bloon(){

}

function scr_snow_ball_consume_bloon(){

	if bloon_stats.health > other.bloon_stats.layers {
		bloon_stats.health += other.bloon_stats.layers
		added_speed += sqrt(other.bloon_stats.layers) / 50
		event_user(0)
	
		var _stat_struct = {
			object: other.object_index,
			class: other.bloon_stats.class,
			layer: other.bloon_stats.layer,
			health: other.bloon_stats.health
		}
		array_push(consumed_bloons, _stat_struct)
	
		instance_destroy(other)
	}


}