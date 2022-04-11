/// @description Insert description here
// You can write your code in this editor


if (input = -1) //KEYBOARD
{
	///moving
	var horMove = keyboard_check(global.rightKey) - keyboard_check( global.leftKey);;
	var verMove = keyboard_check(global.downKey) - keyboard_check(global.upKey);
	
	if (horMove != 0 || verMove != 0)
	{
		var moveDirection = point_direction(0, 0, horMove, verMove);
		//phy_position_x += lengthdir_x(moveSpeed, moveDirection);
		//phy_position_y += lengthdir_y(moveSpeed, moveDirection);
		if (point_distance(0, 0, phy_linear_velocity_x, phy_linear_velocity_y) < moveSpeed)
		{
			phy_linear_velocity_x += lengthdir_x(acceleration, moveDirection);
			phy_linear_velocity_y += lengthdir_y(acceleration, moveDirection);
		}
		//physics_apply_force(phy_position_x, phy_position_y, horMove, verMove)
	}
	
	///Turning

	mouseDirection = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
	var deltaDirection = mouseDirection-bodyDirection;
	if (deltaDirection != 0)
	{
		if ((deltaDirection > 0 && deltaDirection < 180) || deltaDirection < -180)
		{
			bodyDirection += min(rotateSpeed, abs(deltaDirection));
		}
		else
		{
			bodyDirection -= min(rotateSpeed, abs(deltaDirection));
		}
	}

	while (bodyDirection > 360)
	{
		bodyDirection -= 360;
	}
	while (bodyDirection < 0)
	{
		bodyDirection += 360;
	}
}