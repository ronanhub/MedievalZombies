/// @description Insert description here
// You can write your code in this editor
event_inherited();

price = 100;
weaponForSale = ds_map_create();
weaponForSale[? "name"] = "Sword and Shield"
weaponForSale[? "spriteRight"] = sprEqSword;
weaponForSale[? "spriteLeft"] = sprEqShield;
weaponForSale[? "attack1Type"] = attackType.stab;
weaponForSale[? "attack1Value"] = 25;
weaponForSale[? "attack1Poise"] = 35;
weaponForSale[? "attack1Stamina"] = 12;
weaponForSale[? "attack1Mana"] = 0;
weaponForSale[? "attack2Type"] = attackType.blockLeftLight;
weaponForSale[? "attack2Value"] = 50;
weaponForSale[? "attack2Stamina"] = 17;
weaponForSale[? "attack2Mana"] = 0;
weaponForSale[? "uiSprite"] = sprUiSwordShield;
display = noone;

function activateInteraction()
{
	if (objPlayer.gold > price)
	{
		if (ds_list_size(objPlayer.weapons) < 3)
		{
			ds_list_add(objPlayer.weapons, weaponForSale);
			objPlayer.gold -= price;
		}
		else
		{
			//TODO: switch a weapon?
		}
	}
}

function createShopDisplay()
{
	display = instance_create_layer(x+16*image_xscale, y+16*image_xscale, layer, objWeaponShopDisplay);
	display.weaponSprite = weaponForSale[? "uiSprite"];
	display.weaponSubimg = -1;
	text = "PURCHASE "+string_upper(weaponForSale[? "name"])+" ("+string(price)+"G)\n[E]";
}