/// @description Insert description here
// You can write your code in this editor

if instance_number(obj_monkey) <= 0 {
	instance_destroy()	
}

var _target_index = irandom(instance_number(obj_monkey) - 1)
var _i = 0;

with(obj_monkey) {
	if _i = _target_index {
		other.target = id;
		break;
	}
	_i++
}




