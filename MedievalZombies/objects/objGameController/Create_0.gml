/// @description Insert description here
// You can write your code in this editor
wave = 0;
defaultWaveString = "ZZZZZZZZZZ";
waveString = "";
zombies = ds_list_create();

function getWave(ini, section, wave, defaultWave)
{
	ini_open(ini);
	waveString = ini_read_string(section, "Wave"+string(wave), defaultWave);
	ini_close();
}

function zombieKilled(zombie)
{
	var zombieIndex = ds_list_find_index(zombies, zombie);
	if (zombieIndex >= 0)
	{
		ds_list_delete(zombies, zombieIndex);
	}
}

function startWaves()
{
	wave = 1;
	getWave("Level"+string(global.level)+"waves.ini", "DefaultWaves", wave, defaultWaveString);
	alarm[0] = room_speed * 2;
}

function startWaveSwitch()
{
	if wave == 0
	{
		startWaves();
	}
	else if waveString == "" && ds_list_size(zombies) == 0
	{
		wave++;
		getWave("Level"+string(global.level)+"waves.ini", "DefaultWaves", wave, defaultWaveString);
	}
}