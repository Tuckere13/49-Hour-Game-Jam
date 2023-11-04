draw_self();

selector_on = false;						//Whether the selector is over the 
power_up_function = true;					//Have access to the power-up.
power_up_key = keyboard_check(ord("1"));	//map to whatever key suits.

//Cheking if selector on the powerUp image.
if(place_meeting(x,y,obj_selector)){
	selector_on = true;
	
}
//Using power up if key pressed, selector on the image.
if(power_up_key && selector_on){
	power_up_function = false;
}

//Changing sprite of icon when power-up used.
if(power_up_function == false){
	 spr_yesPowerUp = sprite_assign(sprite_index, noPowerUp);
}