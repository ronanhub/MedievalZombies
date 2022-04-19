/// @description Insert description here
// You can write your code in this editor

if string_length(waveString)
{
	var letter = string_char_at(waveString, 1);
	waveString = string_delete(waveString, 1, 1);
	show_debug_message(letter);
	switch(letter)
	{
		case "Z":
			spawnEnemy(objEnemyZombie);
			break;
	}
}

alarm[0] = room_speed * 2;