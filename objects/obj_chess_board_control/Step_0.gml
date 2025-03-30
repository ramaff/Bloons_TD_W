/// @description Insert description here
// You can write your code in this editor

with(obj_monkey) {
	if object_get_parent(object_index) != obj_turret {
		if x > 208 and x < 592 and y > 136 and y < 456 {
			tower_stats.damage_keys = ["chess_board"]
		}
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
	if global.round < 20 {
		saved_round++;	
	}
	saved_round = min(saved_round, 49);
	
	// pick the closest bloon to the bottom
	
	var _picked_piece = noone
	var _picked_pieces_moveable = []
	var _picked_pieces_attackable = []
	
	function check_if_piece_at_position(_h_tiles, _v_tiles, _attacking = false, _jump = false) {
		if instance_position(x+(64*_h_tiles), y+(64*_v_tiles), obj_chess_piece_bloon) {
			return true
		}
		if instance_position(x+(64*_h_tiles), y+(64*_v_tiles), obj_monkey) and !_attacking {
			return true
		}
		
		return false 
	}
	
	function set_moveable_coordinate(_xx, _yy) {
		return {"id": id, "x": _xx * 64, "y": _yy * 64}	
	}
	
	with(obj_pawn_chess_bloon) {
		if !check_if_piece_at_position(0, 1) and !activated {
			_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(0, 1)
		}
	}
	with(obj_knight_chess_bloon) {
		if !check_if_piece_at_position(2, 1) and !activated {
			_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(2, 1)
			break;
		}
		if !check_if_piece_at_position(-2, 1) and !activated {
			_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(-2, 1)
			break;
		}
		if !check_if_piece_at_position(1, 2) and !activated {
			_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(1, 2)
			break;
		}
		if !check_if_piece_at_position(-1, 2) and !activated {
			_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(-1, 2)
			break;
		}
	}
	
	with(obj_bishop_chess_bloon) {
		if !check_if_piece_at_position(1, 1) and !activated {
			if !check_if_piece_at_position(2, 2) {
				if !check_if_piece_at_position(3, 3) {
						if !check_if_piece_at_position(4, 4) {
							_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(4, 4)
						}
					_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(3, 3)
				}
				_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(2, 2)
			}
			_picked_pieces_moveable[array_length(_picked_pieces_moveable)] = set_moveable_coordinate(1, 1)
		}
	}
	
	//_picked_piece = _picked_pieces[irandom(array_length(_picked_pieces)-1)]
	_picked_piece = _picked_pieces_moveable[saved_round mod array_length(_picked_pieces_moveable)]
	
	// move it down 64 px, if a tower is there then it moves up 64 px and gets perma stunned
	_picked_piece.id.y += _picked_piece.y;
	_picked_piece.id.x += _picked_piece.x;
	
	if _picked_piece.id.y > 456 {
		if _picked_piece.id.activated = false {
			with(_picked_piece.id) {
				event_perform(ev_other, ev_user0)	
			}
		}
		_picked_piece.id.activated = true;
		_picked_piece.id.bloon_stats.damage_keys = [];
	}
	
	with(obj_monkey) {
		if point_distance(x, y, _picked_piece.id.x, _picked_piece.id.y) < 40 {
			stun += 999999999;
			y -= _picked_piece.y
			x -= _picked_piece.x
		}
	}
	
	// if chess piece reaches end of board, trigger the pieces actual movement

}




