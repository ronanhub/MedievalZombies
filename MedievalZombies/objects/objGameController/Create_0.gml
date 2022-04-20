/// @description Insert description here
// You can write your code in this editor
wave = 0;
defaultWaveString = "ZZZZZZZZZZ";
waveString = "";
zombies = ds_list_create();

spawnPoints = ds_list_create();
var spawnPointList = spawnPoints;
with(objWaveSpawnPoint)
{
	ds_list_add(spawnPointList, id);
}

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
	getWave("Level"+string(global.level)+"Waves.ini", "DefaultWaves", wave, defaultWaveString);
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
		getWave("Level"+string(global.level)+"Waves.ini", "DefaultWaves", wave, defaultWaveString);
	}
}

function spawnEnemy(enemy)
{
	var spawnPoint = spawnPoints[| irandom(ds_list_size(spawnPoints)-1)];
	var newZombie = instance_create_layer(spawnPoint.x, spawnPoint.y, "Instances", enemy);
	ds_list_add(zombies, newZombie);
}