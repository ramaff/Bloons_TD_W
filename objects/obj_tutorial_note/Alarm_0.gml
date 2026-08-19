if global.round > 0 {
	with(obj_pause_button) {	
		if !paused {
			image_index = 1
			event_user(0)
		}
	}
}