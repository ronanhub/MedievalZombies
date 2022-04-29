/// @description Insert description here
// You can write your code in this editor
x += lengthdir_x(spellVelocity, spellDirection);
y += lengthdir_y(spellVelocity, spellDirection);
if image_xscale < spellScale
{
	image_xscale += .04;
	image_yscale += .04;
}

if !place_free(x, y)
{
	instance_destroy();
}

hitList = ds_list_create();
if instance_place_list(x, y, objParentEnemy, hitList, true) > 0
{
	if passThrough
	{
		for(var hit = 0; hit < ds_list_size(hitList); hit++)
		{
			if ds_list_find_index(hitList, hitList[| hit]) == -1
			{
				ds_list_add(alreadyHitList, hitList[| hit]);
				hitList[| hit].fnTakeDamage(poise, damage)
			}
		}
	}
	else
	{
		hitList[| 0].fnTakeDamage(poise, damage);
		instance_destroy();
	}
}
ds_list_destroy(hitList);