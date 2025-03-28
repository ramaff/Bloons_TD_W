/// @description Insert description here
// You can write your code in this editor

with(obj_monkey) {
	if x > 208 and x < 592 and y > 136 and y < 456 {
		tower_stats.damage_keys = ["chess_board"]
	}
}

if global.round = 0 {
	with(obj_monkey) {
		if x > 208 and x < 592 and y > 136 and y < 456 {
			with (obj_mission_control) {
				event_perform(ev_keypress, vk_space)
				exit;
			}
		}
	}
}


if global.round > saved_round {

	saved_round++;
	if global.round < 25 {
		saved_round++;	
	}
	
	// pick the closest bloon to the bottom
	
	var _picked_piece = noone
	var _picked_pieces = []
	
	with(obj_chess_piece_bloon) {
		if !instance_position(x, y+64, obj_chess_piece_bloon) and !activated {
			_picked_pieces[array_length(_picked_pieces)] = id;
		}
	}
	
	//_picked_piece = _picked_pieces[irandom(array_length(_picked_pieces)-1)]
	_picked_piece = _picked_pieces[saved_round mod array_length(_picked_pieces)]
	
	// move it down 64 px, if a tower is there then it moves up 64 px and gets perma stunned
	_picked_piece.y += 64;
	
	if _picked_piece.y > 456 {
		if _picked_piece.activated = false {
			with(_picked_piece) {
				event_perform(ev_other, ev_user0)	
			}
		}
		_picked_piece.activated = true;
	}
	
	with(obj_monkey) {
		if point_distance(x, y, _picked_piece.x, _picked_piece.y) < 40 {
			stun += 999999999;
			y -= 64;
		}
	}
	
	// if chess piece reaches end of board, trigger the pieces actual movement

}




