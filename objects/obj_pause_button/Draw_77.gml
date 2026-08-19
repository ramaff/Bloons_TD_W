/// @description Insert description here
// You can write your code in this editor

gpu_set_blendenable(false)

if paused {
	
	surface_set_target(application_surface)
	if surface_exists(pause_surf) {
		draw_surface(pause_surf, 0, 0)
		draw_surface(application_surface, 0, 0)
	} else {
		pause_surf = surface_create(960, 540)
		buffer_set_surface(pause_surf_buffer, pause_surf, 0)
	}
	surface_reset_target()
}


gpu_set_blendenable(true)
