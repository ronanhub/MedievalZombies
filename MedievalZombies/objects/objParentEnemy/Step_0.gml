/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case states.idle:
	{
		if mp_grid_path(global.collisionGrid, path, phy_position_x, phy_position_y, global.playerX, global.playerY, true)
		{
			movementDirection = point_direction(path_get_point_x(path, 0), path_get_point_y(path, 0), path_get_point_x(path, lookAheadDistance), path_get_point_y(path, lookAheadDistance));
			phy_position_x += lengthdir_x(movementSpeed, movementDirection);
			phy_position_y += lengthdir_y(movementSpeed, movementDirection);
		}
	}
}