/// @description Insert description here
// You can write your code in this editor

if sprite_index = spr_monster_truck_on {
	other.direction = other.direction - 270 + random(180);

	other.x += lengthdir_x(other.speed + 20, other.direction)
	other.y += lengthdir_y(other.speed + 20, other.direction)

	added_speed = max(0, added_speed - (0.0025 * other.projectile_stats.damage));
}





