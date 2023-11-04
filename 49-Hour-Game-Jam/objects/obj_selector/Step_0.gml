switch (keyboard_key)
{
    case ord("1"):
		offset_x = 30;
    break;

    case ord("2"):
		offset_x = 23.9;
    break;

    case ord("3"):
		offset_x = 17.8;
    break;

    case ord("4"):
		offset_x = 11.7;
    break;
}

if (follow != noone){
	x_to = follow.x;
	y_to = follow.y;
}
x += ((x_to - x)/10) - offset_x;
y += (y_to - y)/10 - 15;