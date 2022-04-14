// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrDamageMobs(type, attackDirection, dmgPoise, dmgPhysical){
	colliders = ds_list_create();
	tempList = ds_list_create();
	switch(type)
	{
		case attackType.stab:
			collision_circle_list(phy_position_x + lengthdir_x(28, attackDirection), phy_position_y + lengthdir_y(28, attackDirection), 14, objParentEnemy, true, true, tempList, true);
			ds_list_copy(colliders, tempList);
			break;
	}
	
	var collider;
	for(var i = 0; i < ds_list_size(colliders); i++)
	{
		collider = colliders[| i];
		collider.fnTakeDamage(dmgPoise, dmgPhysical);
	}
	
	ds_list_destroy(colliders);
	ds_list_destroy(tempList);
}