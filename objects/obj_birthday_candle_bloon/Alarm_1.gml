
image_index = 1

var _class = gift_progression[gift_tier].class
var _layer = gift_progression[gift_tier].layer
var _bobj = gift_progression[gift_tier].bobj

with instance_create_depth(x, y + 20, depth + 1, obj_bloon_gift) {
	bclass = _class
	blayer = _layer
	bobject = _bobj
	bamt = other.gift_loop
	bround = other.bloon_stats.round
	bpath = other.bloon_stats.path
	
}
