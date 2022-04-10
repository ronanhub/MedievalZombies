/// @description Insert description here
// You can write your code in this editor

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
