/// @description Insert description here
// You can write your code in this editor
input = -1;
acceleration = 20;
moveSpeed = 120;
occupiedMoveSpeed = 0.25;
mouseDirection = 0;
bodyDirection = 0;
rotateSpeed = 9;


//stats
maxHitpoints = 100;
Hitpoints = maxHitpoints;
maxMana = 100;
Mana = maxMana;
maxStamina = 100;
Stamina = maxStamina;

state = states.idle;

//weapons
currentWeapon = 0;
currentAttack = attackType.stab;
currentAttackButton = mb_left;

weaponRotationLeft = 0;
weaponAngleLeft = 0;
weaponRotateLeft = 0;
weaponRotateSpeedLeft = 0;

weaponRotationRight = 0;
weaponAngleRight = 0;
weaponRotateRight = 0;
weaponRotateSpeedRight = 0;

weapons = ds_list_create();

var starterWeapon = ds_map_create();
starterWeapon[? "spriteRight"] = sprEqSword;
starterWeapon[? "spriteLeft"] = sprEqShield;
starterWeapon[? "attack1Type"] = attackType.stab;
starterWeapon[? "attack1Value"] = 25;
starterWeapon[? "attack2Type"] = attackType.blockLeftLight;
starterWeapon[? "attack2Value"] = 50;

ds_list_add(weapons, starterWeapon);


//visuals
bodySprite = sprKnightBody;
footSprite = sprKnightFoot;
headSprite = sprKnightHead;
weaponSpriteLeft = weapons[| currentWeapon][? "spriteLeft"];
weaponSpriteRight = weapons[| currentWeapon][? "spriteRight"];