/// @description Insert description here
// You can write your code in this editor



var _i = 0;
var _targetted_monkeys = {}
var _monkey_number = instance_number(obj_monkey)

with(obj_hot_air_bloon) {
	if instance_exists(target) {
		variable_struct_set(_targetted_monkeys, target.id, target.id)
		_monkey_number--;
	}
}

if _monkey_number <= 0 {
	exit;	
}

var _target_index = irandom(_monkey_number)

with(obj_monkey) {
	if _i = _target_index and !variable_struct_exists(_targetted_monkeys, id) {
		other.target = id;
		break;
	}
	_i++
}




