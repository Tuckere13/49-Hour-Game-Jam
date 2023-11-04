grv = 0.2;
hsp = 0;
vsp = 0;
hspWalk = 3.5;
vspJump = -6;
canJump = 0;
canDashLeft= true; 
canDashRight = true;
canDashUp = true;
canDashDown = true;
dashDistance = 160;
dashTime = 16;


StateFree = function()
{
	//Work out where to move horizontally
	hsp = (keyRight - keyLeft) * hspWalk;

	//Work out where to move vertically
	vsp = vsp + grv;

	//Work out if we should Jump
	if (canJump -- > 0) && (keyJump)
	{
		vsp = vspJump;
		canJump = 0;
	}
	
	//Dash input
	if (keyDash)
	{
		canJump = 0;
		dashDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
		dashSp = dashDistance/dashTime;
		dashEnergy = dashDistance;
		
		if dashDirection == 0  && canDashRight == true
		{
			canDashRight = false;
			state = StateDash;
		}
		else if dashDirection == 180 && canDashLeft == true
		{
			canDashLeft = false;
			state = StateDash;
		}
		else if dashDirection == 90 && canDashUp == true
		{
			canDashUp = false;
			state = StateDash;
		}
		else if dashDirection == 270 && canDashDown == true
		{
			canDashDown= false;
			state = StateDash;
		}
		
	}

	//Collide and Move
	if (place_meeting(x + hsp, y, obj_ground))
	{
		while (abs(hsp) > 0.1)
		{
			hsp *= 0.5;
			if(!place_meeting(x + hsp, y, obj_ground)) x += hsp;
		}
		hsp = 0;
	}
	x+= hsp;

	//vertical collision
	if (place_meeting(x, y + vsp, obj_ground))
	{
		if (vsp > 0)
		{
			canJump = 10;
		}
		while (abs(vsp) > 0.1)
		{
			vsp *= 0.5;
			if (!place_meeting(x, y + vsp, obj_ground)) y += vsp;
		}
		vsp = 0;
	}
	y += vsp;
}

StateDash = function()
{

	//Move Via the dash
	hsp = lengthdir_x(dashSp, dashDirection);
	vsp = lengthdir_y(dashSp,dashDirection);
	
	//Trail Effect
	with (instance_create_depth(x,y,depth+1,obj_trail))
	{
		sprite_index = other.sprite_index;
		image_blend = c_fuchsia;
		image_alpha = 0.7;
	}
	
	//Horizontal Collission
	if (place_meeting(x + hsp, y, obj_ground))
	{
		while (abs(hsp) > 0.1)
		{
			hsp *= 0.5;
			if(!place_meeting(x + hsp, y, obj_ground)) x += hsp;
		}
		hsp = 0;
	}
	x+= hsp;

	//vertical collision
	if (place_meeting(x, y + vsp, obj_ground))
	{

		while (abs(vsp) > 0.1)
		{
			vsp *= 0.5;
			if (!place_meeting(x, y + vsp, obj_ground)) y += vsp;
		}
		vsp = 0;
	}
	y += vsp;
	
	//Ending the dash
	dashEnergy -= dashSp;
	if (dashEnergy <= 0)
	{
		vsp = 0;
		hsp = 0;
		state = StateFree;
	}
}



state = StateFree;

