/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_banana_icon, 0, 816, 4)
draw_text_ext_color(880, 24, global.money, 18, 128, c_black, c_black, c_black, c_black, 1)

draw_sprite(spr_lives_icon, 0, 816, 48)
draw_text_ext_color(880, 64, global.lives, 18, 128, c_black, c_black, c_black, c_black, 1)

draw_text(32, 4, "Round")
draw_text(32, 48, string(global.round) + "/" + string(array_length(global.bloon_sends)))