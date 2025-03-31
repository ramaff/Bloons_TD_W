// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_if_piece_at_position(_piece_id, _h_tiles, _v_tiles) {
	var _xx = _piece_id.x+(64*_h_tiles)
	var _yy = _piece_id.y+(64*_v_tiles)
	if _xx < 208 || _xx > 592 {
		return true
	}

	with(obj_chess_piece_bloon) {
		if point_distance(x, y, _xx, _yy) < 16 {
			return true
		}
	}
	with(obj_monkey) {
		if point_distance(x, y, _xx, _yy) < 32 {
			return true
		}
	}
	
	return false
}

function check_if_piece_can_attack(_piece_id, _h_tiles, _v_tiles) {
	var _xx = _piece_id.x+(64*_h_tiles)
	var _yy = _piece_id.y+(64*_v_tiles)
	if _xx < 208 || _xx > 592 || _yy < 136 {
		return false
	}
	with(obj_chess_piece_bloon) {
		if point_distance(x, y, _xx, _yy) < 16 {
			return false
		}
	}
	with(obj_monkey) {
		if object_get_parent(object_index) != obj_turret and abs(point_distance(x, y, _xx, _yy)) < 40 and stun <= 0 {
			return true
		}
	}
	
	return false 
}
	
function set_moveable_coordinate(_piece_id, _xx, _yy) {
	return {"id": _piece_id, "x": _xx * 64, "y": _yy * 64}	
}
	
function add_if_possible(_piece_id, _picked_pieces, _h_tiles, _v_tiles, _attacking = false, _jump = false) {
	var _xx = 0;
	var _yy = 0;
	if _jump {
		_xx = _h_tiles;
		_yy = _v_tiles;
	}
	while(_xx != _h_tiles || _yy != _v_tiles || _jump) {
		
		var _pot_x = scr_converge(_xx, _h_tiles, 1)
		var _pot_y = scr_converge(_yy, _v_tiles, 1)
		
		if _attacking == true {
			if check_if_piece_can_attack(_piece_id, _pot_x, _pot_y) {
				_picked_pieces[array_length(_picked_pieces)] = set_moveable_coordinate(_piece_id, _pot_x, _pot_y)
				return true
			}
		} 
		var _blocked_by_piece_at_position = check_if_piece_at_position(_piece_id, _pot_x, _pot_y)
		if _blocked_by_piece_at_position == false {
			_xx = _pot_x;
			_yy = _pot_y;
			if _jump {
				break;	
			}
		} else if _blocked_by_piece_at_position == true {
			if _jump {
				return false	
			}
			break
		}
		
		
	}
	if (_xx != 0 || _yy != 0) and _attacking == false {
		_picked_pieces[array_length(_picked_pieces)] = set_moveable_coordinate(_piece_id, _xx, _yy)
		return true
	}
	return false
}