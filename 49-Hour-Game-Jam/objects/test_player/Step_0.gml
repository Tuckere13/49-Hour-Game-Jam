/// @description Insert description here
// You can write your code in this editor
dash_left = keyboard_check_pressed(vk_left);
dash_right = keyboard_check_pressed(vk_right);

if (dash_right) 
{
	x+=dash_amount;
}
if (dash_left)
{
	x-=dash_amount;
}

