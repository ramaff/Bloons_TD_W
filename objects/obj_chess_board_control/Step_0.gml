/// @description Insert description here
// You can write your code in this editor

with(obj_monkey) {
	if object_get_parent(object_index) != obj_turret {
		if original_x > 208 and original_x < 592 and original_y > 136 and original_y < 456 {
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

if global.round >= 49 {
	with(obj_chess_piece_bloon) {
		if !activated {
			event_perform(ev_other, ev_user0)
			activated = true;
			bloon_stats.damage_keys = [];
		}
	}
}


if global.round > saved_round {

	saved_round++;
	if global.round < 20 {
		saved_round++;	
	}
	if global.round > 35 {
		saved_round -= 0.5;	
	}
	
	// pick the closest bloon to the bottom
	
	var _picked_piece = noone
	var _picked_pieces_moveable = []
	var _picked_pieces_attackable = []
	
	with(obj_pawn_chess_bloon) {
		if activated {
			continue;	
		}
		if add_if_possible(id, _picked_pieces_attackable, 1, 1, true, false) == true {
			continue;	
		}
		if add_if_possible(id, _picked_pieces_attackable, -1, 1, true, false) == true {
			continue;
		}
		add_if_possible(id, _picked_pieces_moveable, 0, 1, false, false)
	}
	if global.round >= 25 {
		with(obj_knight_chess_bloon) {
			if activated {
				continue;
			}
			if add_if_possible(id,_picked_pieces_attackable, 1, 2, true, true) {
				continue;
			}
			if add_if_possible(id,_picked_pieces_attackable, -1, 2, true, true) {
				continue;	
			}
			if add_if_possible(id,_picked_pieces_attackable, 2, 1, true, true) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, 2, 1, true, true) {
				continue;	
			}
			if add_if_possible(id,_picked_pieces_moveable, 1, 2, false, true) {
				continue;	
			}
			if add_if_possible(id,_picked_pieces_moveable, -1, 2, false, true) {
				continue;	
			}
			if add_if_possible(id,_picked_pieces_moveable, 2, 1, false, true) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_moveable, 2, 1, false, true) {
				continue;	
			}
		}
		with(obj_rook_chess_bloon) {
			if activated {
				continue;
			}
			if add_if_possible(id, _picked_pieces_attackable, 5, 0, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, -5, 0, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, 0, 5, true, false) {
				continue;	
			}
			
			if add_if_possible(id, _picked_pieces_moveable, 0, 5, false, false) {
				continue;	
			}
		}
	}
	if global.round >= 30 {
		with(obj_bishop_chess_bloon) {
			if activated {
				continue;
			}
			if add_if_possible(id, _picked_pieces_attackable, 5, 5, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, -5, 5, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_moveable, 5, 5, false, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_moveable, -5, 5, false, false) {
				continue;
			}
		}
	}
	if global.round >= 35 {
		with(obj_queen_chess_bloon) {
			if activated {
				continue;
			}
			if add_if_possible(id, _picked_pieces_attackable, 5, 0, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, -5, 0, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, 0, 5, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, 5, 5, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, -5, 5, true, false) {
				continue;	
			}
			
			if add_if_possible(id, _picked_pieces_moveable, 0, 5, false, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_moveable, 5, 5, false, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_moveable, -5, 5, false, false) {
				continue;
			}
		}
		with(obj_king_chess_bloon) {
			if activated {
				continue;
			}
			if add_if_possible(id, _picked_pieces_attackable, 1, 0, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, -1, 0, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, 0, 1, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, 1, 1, true, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_attackable, -1, 1, true, false) {
				continue;	
			}
			
			if add_if_possible(id, _picked_pieces_moveable, 0, 1, false, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_moveable, 1, 1, false, false) {
				continue;	
			}
			if add_if_possible(id, _picked_pieces_moveable, -1, 1, false, false) {
				continue;
			}
		}
	}
	
	//_picked_piece = _picked_pieces[irandom(array_length(_picked_pieces)-1)]
	if array_length(_picked_pieces_attackable) > 0 {
		_picked_piece = _picked_pieces_attackable[saved_round mod array_length(_picked_pieces_attackable)]
	} else if array_length(_picked_pieces_moveable) > 0 {
		_picked_piece = _picked_pieces_moveable[saved_round mod array_length(_picked_pieces_moveable)]
	}
	
	if _picked_piece = noone {
		exit	
	}
	if !instance_exists(_picked_piece.id) {
		exit;
	}
	
	// move it down 64 px, if a tower is there then it moves up 64 px and gets perma stunned
	_picked_piece.id.y += _picked_piece.y;
	_picked_piece.id.x += _picked_piece.x;
	
	if _picked_piece.id.y > 456 {
		if _picked_piece.id.activated = false {
			with(_picked_piece.id) {
				if id = _picked_piece.id {
					event_perform(ev_other, ev_user0)	
				}
			}
		}
		_picked_piece.id.activated = true;
		_picked_piece.id.bloon_stats.damage_keys = [];
	}
	
	with(obj_monkey) {
		if instance_exists(tower_base) {
			if point_distance(tower_base.x, tower_base.y, _picked_piece.id.x, _picked_piece.id.y) < 40 {
				stun += _picked_piece.id.bloon_stats.max_health;
				tower_base.y -= _picked_piece.y
				tower_base.x -= _picked_piece.x
			}
		} else if point_distance(x, y, _picked_piece.id.x, _picked_piece.id.y) < 40 {
			stun += _picked_piece.id.bloon_stats.max_health;
			y -= _picked_piece.y
			x -= _picked_piece.x
		}
	}
	
	// if chess piece reaches end of board, trigger the pieces actual movement

}




