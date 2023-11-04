/// @description Insert description here
// You can write your code in this editor
	_coll = collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, obj_ground, true, true);
	show_debug_message(_coll);
	draw_set_colour(c_lime);
	draw_line(obj_player.x, obj_player.y, mouse_x, mouse_y, 5);
	draw_line(50, 50, 150, 150);
