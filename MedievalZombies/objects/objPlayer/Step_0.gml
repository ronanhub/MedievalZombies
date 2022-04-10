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
		phy_position_x += lengthdir_x(moveSpeed, moveDirection);
		phy_position_y += lengthdir_y(moveSpeed, moveDirection);
	}
	
	///Turning

	mouseDirection = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
	var deltaDirection = mouseDirection-faceDirection;
	if (deltaDirection != 0)
	{
		if ((deltaDirection > 0 && deltaDirection < 180) || deltaDirection < -180)
		{
			faceDirection += min(rotateSpeed, abs(deltaDirection));
		}
		else
		{
			faceDirection -= min(rotateSpeed, abs(deltaDirection));
		}
	}

	while (faceDirection > 360)
	{
		faceDirection -= 360;
	}
	while (faceDirection < 0)
	{
		faceDirection += 360;
	}
}