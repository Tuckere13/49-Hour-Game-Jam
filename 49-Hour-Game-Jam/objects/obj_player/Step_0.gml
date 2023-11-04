move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
move_x = move_x * move_speed;

if place_meeting(x,y+2, obj_ground /*ground*/){
	move_y = 0;
	
	if keyboard_check(vk_space) move_y = -jump_speed;
}
else if move_y < 10
{
	 move_y +=1;	
}

move_and_collide(move_x, move_y, obj_ground /*ground*/);

/*
if move_x != 0
{
	image_xscale = sign(move_x);
}
*/

var hor_speed = 0;
var vert_speed = 0;

var can_jump = 10;
var can_dash = false;
var dash_distance = 160;
var dash_time = 15;

var can_left_dash = false;
var can_right_dash = false;
var can_up_dash = false;
can_down_dash = false;

/*can_leftUp_dash = false;
can_rightUp_dash = false;
can_leftDown_dash = false;
can_rightDown_dash = false;*/

State_Norm = function(){
	
	//Function for the dash mechanic.
	if(can_dash && dash_key){
		can_jump = false;
		
		if(dash_key && key_left){
			dash_direction = point_direction(0,0, key_left, key_down - key_up);
			dash_speed = dash_distance / dash_time;
			state = State_Dash;
			dash_left = false;
			dash_speed = dash_distance / dash_time;
			state = State_Dash;
		}
		
		if(dash_key && key_right){
			dash_direction = point_direction(0,0, key_right, key_down - key_up);
			dash_speed = dash_distance / dash_time;
			state = State_Dash;
			dash_right = false;
			dash_speed = dash_distance / dash_time;
			state = State_Dash;
		}
		
		if(dash_key && key_up){
			dash_direction = point_direction(0,0, key_right - key_left, key_up);
			dash_speed = dash_distance / dash_time;
			state = State_Dash;
			dash_up = false;
			dash_speed = dash_distance / dash_time;
			dash_energy = dash_distance;
			state = State_Dash;
		}
		
		if(dash_key && key_down){
			dash_direction = point_direction(0,0, key_right - key_left, key_down);
			dash_speed = dash_distance / dash_time;
			state = State_Dash;
			dash_down = false;
			dash_speed = dash_distance / dash_time;
			state = State_Dash;
		}
		
	}

}

State_Dash = function(){
	
	//Speeds from the dash.
	hor_speed = lengthdir_x(dash_speed, dash_direction);
	vert_speed = lengthdir_y(dash_speed, dash_direction);
	
	//End dash
	dash_energy -= dash_speed;
	if(dash_energy <= 0){
		vert_speed = 0;
		hor_speed = 0;
		state = State_Norm;
		
	}
	

}