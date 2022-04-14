/// @description Insert description here
// You can write your code in this editor
zombies = ds_list_create();
zombiesLeft = ds_list_create();

function zombieKilled(zombie)
{
	var zombieIndex = ds_list_find_index(zombies, zombie);
	if (zombieIndex >= 0)
	{
		ds_list_delete(zombies, zombieIndex);
	}
}