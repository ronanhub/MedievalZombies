/// @description Insert description here
// You can write your code in this editor
event_inherited();

price = 100;
text = "PURCHASE SWORD AND SHIELD ("+string(price)+"G)\n[E]";
weaponForSale = ds_map_create();
weaponForSale[? "spriteRight"] = sprEqSword;
weaponForSale[? "spriteLeft"] = sprEqShield;
weaponForSale[? "attack1Type"] = attackType.stab;
weaponForSale[? "attack1Value"] = 25;
weaponForSale[? "attack1Poise"] = 35;
weaponForSale[? "attack1Stamina"] = 12;
weaponForSale[? "attack2Type"] = attackType.blockLeftLight;
weaponForSale[? "attack2Value"] = 50;
weaponForSale[? "attack2Stamina"] = 17;
weaponForSale[? "uiSprite"] = sprUiSwordShield;


function activateInteraction()
{
	if (objPlayer.gold > price)
	{
		if (ds_list_size(objPlayer.weapons) < 3)
		{
			ds_list_add(objPlayer.weapons, weaponForSale);
		}
		else
		{
			//TODO: switch a weapon?
		}
	}
}