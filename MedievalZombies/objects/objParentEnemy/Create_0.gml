/// @description Insert description here
// You can write your code in this editor
maxHitpoints = 50;
hitpoints = maxHitpoints;

maxPoise = 100;
poiseRecovery = 1;
stunPoiseRecovery = 3;
poise = 0;

allowCritical = false;
movementSpeed = 0.6;
damage = 5;
cooldown = 25;
reward = 5;
state = states.idle;

path = path_add();
lookAheadDistance = 1;
movementDirection = 0;
lookDirection = 0;
rotateSpeed = 3;
attackDistance = 40;
lungeTime = 7;
lungeTimeLeft = lungeTime;
lungeSpeed = 2;
lungeDirection = 0;
recoverTime = 55;
recoverTimeLeft = recoverTime;

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
		objPlayer.gold += reward;
		instance_destroy();
	}
}