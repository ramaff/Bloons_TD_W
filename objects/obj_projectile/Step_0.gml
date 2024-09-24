/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(projectile_stats, "lobbing") {
	
	y -= projectile_stats.lobbing.speed
	projectile_stats.height += projectile_stats.lobbing.speed
	
	projectile_stats.lobbing.speed -= projectile_stats.lobbing.gravity
	if projectile_stats.height <= 0 {
		projectile_stats.lobbing.speed = projectile_stats.lobbing.speed * (-1)
	}
}
if variable_struct_exists(projectile_stats, "friction") {
	
	projectile_stats.speed -= projectile_stats.friction;
	projectile_stats.speed = max(projectile_stats.speed, 0);
	speed = projectile_stats.speed;
}



