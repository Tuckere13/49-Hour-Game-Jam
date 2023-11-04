draw_self();

power_up_function = true;
power_up_key = keyboard_check(vk_enter);

if(power_up_key){
	power_up_function = false;
}

if(power_up_function == false){
	 spr_yesPowerUp = sprite_assign(sprite_index, noPowerUp);
}
