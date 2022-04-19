/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case states.idle:
		if (point_distance(phy_position_x, phy_position_y, global.playerX, global.playerY) < attackDistance)
		{
			state = states.lunge;
			lungeDirection = point_direction(phy_position_x, phy_position_y, global.playerX, global.playerY);
			lungeTimeLeft = lungeTime;
			lookDirection = lungeDirection;
		}
		else if mp_grid_path(global.collisionGrid, path, phy_position_x, phy_position_y, global.playerX, global.playerY, true)
		{
			movementDirection = point_direction(path_get_point_x(path, 0), path_get_point_y(path, 0), path_get_point_x(path, lookAheadDistance), path_get_point_y(path, lookAheadDistance));
			phy_position_x += lengthdir_x(movementSpeed, movementDirection);
			phy_position_y += lengthdir_y(movementSpeed, movementDirection);
		}
		break;
	case states.stun:
		if (poise > 0)
		{
			poise -= stunPoiseRecovery;
		}
		else
		{
			poise = 0;
			state = states.idle;
		}
		break;
	case states.lunge:
		phy_position_x += lengthdir_x(lungeSpeed, lungeDirection);
		phy_position_y += lengthdir_y(lungeSpeed, lungeDirection);
		lungeTimeLeft--;
		if (lungeTimeLeft <= 0)
		{
			state = states.recover;
			recoverTimeLeft = recoverTime;
		}
		break;
	case states.recover:
		recoverTimeLeft--;
		if (recoverTimeLeft <= 0)
		{
			state = states.idle;
		}
		break;
}