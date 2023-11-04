
global.hook = true;
var _coll = 0;

//while (global.hook == true) {
	alarm[0] = 180;
//}

function fxcoll() 
{
	_coll = collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, obj_ground, true, true);
	show_debug_message(_coll);
	draw_set_colour(c_lime);
	draw_line(obj_player.x, obj_player.y, mouse_x, mouse_y);
	draw_line(50, 50, 150, 150);
}

//gravity_direction = 0;
//gravity = 1;