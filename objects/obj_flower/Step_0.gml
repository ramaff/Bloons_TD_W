// Inherit the parent event
event_inherited();

//show_debug_message(thorns)

if attacked {
	thorns -= 3
} else if stun > 0 {
	thorns -= 0.05
}
if thorns <= 0 {
	var _tower = id
	with (obj_tower_tile) {
		if tower_id = _tower {
			instance_destroy()
		}
	}
	instance_destroy()	
}
