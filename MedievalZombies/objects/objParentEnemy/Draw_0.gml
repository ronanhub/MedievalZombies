/// @description Insert description here
// You can write your code in this editor

var deltaDirection = movementDirection-lookDirection;
if (deltaDirection != 0)
{
	if ((deltaDirection > 0 && deltaDirection < 180) || deltaDirection < -180)
	{
		lookDirection += min(rotateSpeed, abs(deltaDirection));
	}
	else
	{
		lookDirection -= min(rotateSpeed, abs(deltaDirection));
	}
}

while (lookDirection > 360)
{
	lookDirection -= 360;
}
while (lookDirection < 0)
{
	lookDirection += 360;
}

draw_sprite_ext(sprite_index, image_index, phy_position_x, phy_position_y, 1, 1, lookDirection, c_white, image_alpha);