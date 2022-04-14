/// @description Insert description here
// You can write your code in this editor
maxHitpoints = 100;
hitpoints = maxHitpoints;

maxPoise = 100;
poiseRecovery = 1;
stunPoiseRecovery = 3;
poise = 0;

allowCritical = false;
movementSpeed = 0.8;
damage = 5;
cooldown = 25;
reward = 5;
state = states.idle;

path = path_add();
lookAheadDistance = 1;
movementDirection = 0;
lookDirection = 0;
rotateSpeed = 3;

function fnTakeDamage(dmgPoise, dmgPhysical)
{
	if (state != states.stun)
	{
		poise += dmgPoise;
		if (poise >= maxPoise)
		{
			state = states.stun;
		}
	}
	hitpoints -= dmgPhysical;
	
	if (hitpoints <= 0)
	{
		if (instance_exists(objGameController))
		{
			objGameController.zombieKilled(id);
		}
		instance_destroy();
	}
}