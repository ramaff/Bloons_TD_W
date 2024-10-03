// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_heavy_hops(){
	max_hop_speed = max_hop_speed * 1.75;
	hop_gravity = hop_gravity * 1.75;
}

function scr_quick_hops(){
	hop_gravity = hop_gravity * 1.5;
}

function scr_jackhammer(){
	hop_gravity = hop_gravity * 3;
}

function scr_drill(){
	hop_gravity = hop_gravity * 4.5;
	max_hop_speed = max_hop_speed * 1.5;
}