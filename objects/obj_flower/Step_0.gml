// Inherit the parent event
event_inherited();

show_debug_message(thorns)

if attacked {
	thorns--
}
if thorns <= 0 {
	instance_destroy()	
}
