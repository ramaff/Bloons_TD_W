function scr_create_note(_note_info, _note_prog, _key){

	if !variable_struct_exists(_note_prog, _key) and variable_struct_exists(_note_info, _key) {
		var _specific_tutorial = variable_struct_get(_note_info, _key)
		with instance_create_depth(400, 240, depth - 100, obj_tutorial_note) {
			text = variable_struct_get(_specific_tutorial, "text")
			icon = noone;
			if variable_struct_exists(_specific_tutorial, "icon") {
				icon = variable_struct_get(_specific_tutorial, "icon")
				icon = asset_get_index(icon)
				image_index = 1
				icon_index = 0
				if variable_struct_exists(_specific_tutorial, "icon_index") {
					icon_index = variable_struct_get(_specific_tutorial, "icon_index")
				}
				image_speed = 0
			}
			page = 0;
			mission = global.mission
			key = "0"
			alarm[0] = 1
		}
	}

}