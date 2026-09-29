draw_self()

draw_set_colour(c_black)

var _unlocked = variable_struct_get(global.towers_progress, goodie_key).unlocked

if _unlocked {
	draw_text(x + 32, y + 24, $"unlocked {goodie_key}!")
	draw_text(x + 240, y + 60, "yay")
} else {
	draw_text(x + 32, y + 24, $"unlock {goodie_key}?")
	draw_text(x + 240, y + 60, $"${goodie_cost}")
}