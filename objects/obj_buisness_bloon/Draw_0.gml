/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if alarm[2] mod 5 = 0 {

	var _i = 0;
	var _total_investments = array_length(tower_investments)

	for(_i = 0; _i < _total_investments; _i++) {
		var _tower = tower_investments[_i].id;
		var _tx = x;
		var _ty = y;
	
		with(_tower) {
			_tx = x;
			_ty = y;
		}
		
		var _cur_x = x;
		var _cur_y = y;
		var _dist = point_distance(_cur_x, _cur_y, _tx, _ty)
		var _col = c_lime
		
		while _dist > 50 {
			var _ang_var = -60 + random(120)
			if _ang_var < 0 {
				_col = c_red	
			} else {
				_col = c_lime	
			}
			var _tar_dir = point_direction(_cur_x, _cur_y, _tx, _ty) - _ang_var;
			var _new_x = _cur_x + lengthdir_x(50, _tar_dir);
			var _new_y = _cur_y + lengthdir_y(50, _tar_dir);
			
			draw_line_width_colour(_cur_x, _cur_y, _new_x, _new_y, 2, _col, _col);
			
			_cur_x = _new_x;
			_cur_y = _new_y;
			_dist = point_distance(_cur_x, _cur_y, _tx, _ty)
		}
		
		draw_line_width_colour(_cur_x, _cur_y, _tx, _ty, 2, _col, _col);
		
		
	}



	
}
