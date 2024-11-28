/// @description Insert description here
// You can write your code in this editor

var _dir = other.direction
with instance_create_depth(other.x, other.y, depth - 10, obj_slash) {
	image_angle = _dir - 90
}

other.bloon_stats.tattered = true
other.bloon_stats.tattered_sprite = "spr_lead_tattered"
other.path_speed = other.bloon_stats.speed * 2;


