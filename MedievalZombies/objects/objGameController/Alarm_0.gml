/// @description Insert description here
// You can write your code in this editor

if (string_length(waveString) >= 1)
{
	if (ds_list_size(zombies) < wave*1.5 + 3)
	{
		var letter = string_char_at(waveString, 1);
		waveString = string_delete(waveString, 1, 1);
		show_debug_message(letter);
		switch(letter)
		{
			case "Z":
				spawnEnemy(objEnemyZombie);
				break;
			case "A":
				spawnEnemy(objEnemyZombieArmoured);
				break;
		}
	}
}
else if ds_list_size(zombies) == 0
{
	with(objStartGameSwitch)
	{
		active = true;
	}
}

alarm[0] = room_speed * 5;