/// @description Insert description here
move_speed = 5;
jump_speed = 16;

move_x = 0;
move_y = 0;

can_dash = false;
dash_distance = 160;
dash_time = 16;

StateFree = function(){

    if place_meeting(x,y+2, obj_ground){
        move_y = 0;
		can_dash = true;
		
        if keyboard_check(vk_space) move_y = -jump_speed;

    }
    else if move_y < 10
    {
         move_y +=1;
    }

    if keyboard_check(vk_shift) and can_dash {
		can_dash = false;
        dashDirection = point_direction(0,0, keyboard_check(ord("D")) - keyboard_check(ord("A")), move_y);
        dashSp = dash_distance/dash_time;
        dashEnergy = dash_distance;
        state = StateDash;
    }

    move_and_collide(move_x, move_y, obj_ground );
}

StateDash = function(){

    //move via dash
	
	move_and_collide(move_x, move_y, obj_ground);
    move_x = -lengthdir_x(dashSp, dashDirection);
    move_y = lengthdir_y(dashSp, dashDirection);
	
	if place_meeting(x,y+2, obj_ground){
    move_y = 0;
	can_dash = true;
		
    if keyboard_check(vk_space) move_y = -jump_speed;

    }
    else if move_y < 10
    {
         move_y +=1;
    }
	
	
	//Trail effect
	with (instance_create_depth(x,y,depth,obj_trail)){
	sprite_index = other.sprite_index;
	image_blend = c_fuchsia;
	image_alpha = 0.7;
	}

    dashEnergy -= dashSp;
    if (dashEnergy <= 0) {
        move_y = 0;
        move_x = 0;
        state = StateFree;
    }
}

state = StateFree;
