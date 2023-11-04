if keyboard_check_pressed(vk_right) and obj_selector.x != last_pos{
	obj_selector.x += 64
}
else if keyboard_check_pressed(vk_left) and obj_selector.x != first_pos{
	obj_selector.x -= 64
}
	
	
switch (keyboard_key)
{
    case ord("1"):
        obj_selector.x = 192
    break;

    case ord("2"):
        obj_selector.x = 256
    break;

    case ord("3"):
        obj_selector.x = 320
    break;

    case ord("4"):
        obj_selector.x = 384
    break;
}