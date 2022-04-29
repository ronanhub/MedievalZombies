/// @description Insert description here
// You can write your code in this editor
input = -1;
acceleration = 24;
moveSpeed = 140;
occupiedMoveSpeed = 0.4;
mouseDirection = 0;
bodyDirection = 0;
rotateSpeed = 9;

currentInteraction = noone;

//stats
gold = 1110;
maxHitpoints = 100;
hitpoints = maxHitpoints;
maxMana = 100;
mana = maxMana;
manaRegen = 0.1;
manaRegenerating = true;
manaRegenTime = 120;
maxStamina = 100;
stamina = maxStamina;
staminaRegen = 0.5;
staminaRegenerating = true;
staminaRegenTime = 60;
function drainStamina(amount)
{
	if (amount > 0)
	{
		stamina -= amount;
		staminaRegenerating = false;
		alarm[0] = staminaRegenTime;
	}
}
function drainMana(amount)
{
	if (amount > 0)
	{
		mana -= amount;
		manaRegenerating = false;
		alarm[1] = manaRegenTime;
	}
}

state = states.idle;

//weapons
currentWeapon = 0;
currentAttack = attackType.stab;
currentAttackStamina = 0;
currentAttackMana = 0;
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
starterWeapon[? "attack1Poise"] = 35;
starterWeapon[? "attack1Stamina"] = 12;
starterWeapon[? "attack1Mana"] = 0;
starterWeapon[? "attack2Type"] = attackType.blockLeftLight;
starterWeapon[? "attack2Value"] = 50;
starterWeapon[? "attack2Stamina"] = 17;
starterWeapon[? "attack2Mana"] = 0;
starterWeapon[? "uiSprite"] = sprUiSwordShield;

ds_list_add(weapons, starterWeapon);

function castSpell(spellX, spellY, spellVelocity, spellDirection, spellSprite, spellSubimg, spellScale, spellColour, spellAlpha, passThrough, damage, poise)
{
	var spell = instance_create_layer(spellX, spellY, layer, objSpell);
	spell.spellVelocity = spellVelocity;
	spell.sprite_index = spellSprite;
	spell.spellSubimg = spellSubimg;
	spell.image_xscale = .02;
	spell.image_yscale = .02;
	spell.spellScale = spellScale;
	spell.spellDirection = spellDirection;
	spell.spellColour = spellColour;
	spell.spellAlpha = spellAlpha;
	spell.passThrough = passThrough;
	spell.damage = damage;
	spell.poise = poise;
}

//visuals
bodySprite = sprKnightBody;
footSprite = sprKnightFoot;
headSprite = sprKnightHead;
weaponSpriteLeft = weapons[| currentWeapon][? "spriteLeft"];
weaponSpriteRight = weapons[| currentWeapon][? "spriteRight"];

function updateWeaponSprite()
{
	weaponSpriteLeft = weapons[| currentWeapon][? "spriteLeft"];
	weaponSpriteRight = weapons[| currentWeapon][? "spriteRight"];
}