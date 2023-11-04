if keyboard_check_pressed(vk_right) and obj_selector.x != last_pos{
	obj_selector.x += 64
}
else if keyboard_check_pressed(vk_left) and obj_selector.x != first_pos{
	obj_selector.x -= 64
}
	