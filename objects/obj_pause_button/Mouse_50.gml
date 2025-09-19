/// @description Insert description here
// You can write your code in this editor
/*
if paused {

	instance_activate_all()

	if surface_exists(pause_surf) {
		surface_free(pause_surf)
	}
	if buffer_exists(pause_surf_buffer) {
		buffer_delete(pause_surf_buffer)	
	}
	
	with(all) {
		event_perform(ev_draw, 0)	
	}

	pause_surf = surface_create(960, 540)
	surface_set_target(pause_surf)
	draw_surface(application_surface, 0, 0)
	surface_reset_target()
	
	if buffer_exists(pause_surf_buffer) {
		buffer_delete(pause_surf_buffer)	
	}
	pause_surf_buffer = buffer_create(960 * 540 * 5, buffer_fixed, 1)
	buffer_get_surface(pause_surf_buffer, pause_surf, 0)

	instance_deactivate_all(true)
	instance_activate_object(obj_menu_button_parent)
	
}
