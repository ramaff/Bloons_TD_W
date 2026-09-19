// Inherit the parent event
event_inherited();

var _ab = variable_struct_get(tower_stats.abilities, "Summon Golden Bloon")

if _ab.charges >= 1 {
	image_index = 1	
} else {
	image_index = 0	
}

