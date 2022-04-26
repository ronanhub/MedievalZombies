/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);
draw_healthbar(0, 0, global.uiScale*3.5, global.uiScale*0.4, (hitpoints / maxHitpoints) * 100, c_gray, c_maroon, c_red, 0, true, true);
draw_healthbar(0, global.uiScale*0.4+2, global.uiScale*3.3, global.uiScale*0.6, (mana / maxMana) * 100, c_gray, c_blue, c_aqua, 0, true, true);
draw_healthbar(0, global.uiScale*0.6+2, global.uiScale*3.3, global.uiScale*0.8, (stamina / maxStamina) * 100, c_gray, c_green, c_lime, 0, true, true);
draw_set_halign(fa_left);
draw_text(10, global.uiScale, "Gold: "+string(gold));

//weapon boxes
var leftWeapon = currentWeapon-1;
if (leftWeapon < 0)
{
	leftWeapon = 2;
}
var rightWeapon = currentWeapon+1;
if (rightWeapon > 2)
{
	leftWeapon = 0;
}
var boxSize = global.uiScale*.7;
var smallBoxSize = global.uiScale*.56;
var weaponScale = global.uiScale*.035;
var smallWeaponScale = global.uiScale*.025;
draw_set_colour(c_black);
draw_rectangle(global.uiXMiddle-boxSize, global.uiBottom-2*boxSize, global.uiXMiddle+boxSize, global.uiBottom, false);
draw_rectangle(global.uiXMiddle-boxSize-2*smallBoxSize, global.uiBottom-2*smallBoxSize, global.uiXMiddle-boxSize-1, global.uiBottom, false);
draw_rectangle(global.uiXMiddle+boxSize+1, global.uiBottom-2*smallBoxSize, global.uiXMiddle+boxSize+2*smallBoxSize, global.uiBottom, false);
draw_set_colour(c_dkgray);
draw_rectangle(global.uiXMiddle-boxSize+3, global.uiBottom-2*boxSize+3, global.uiXMiddle+boxSize-3, global.uiBottom-3, false);
draw_rectangle(global.uiXMiddle-boxSize-2*smallBoxSize+2, global.uiBottom-2*smallBoxSize+2, global.uiXMiddle-boxSize-3, global.uiBottom-2, false);
draw_rectangle(global.uiXMiddle+boxSize+3, global.uiBottom-2*smallBoxSize+2, global.uiXMiddle+boxSize+2*smallBoxSize-2, global.uiBottom-2, false);

//middle item
var weaponToDraw = weapons[| currentWeapon];
draw_sprite_ext(weaponToDraw[? "uiSprite"], 0, global.uiXMiddle, global.uiBottom - boxSize, weaponScale, weaponScale, 0, c_white, 1);
draw_sprite_ext(weaponToDraw[? "uiSprite"], 0, global.uiXMiddle-boxSize-smallBoxSize, global.uiBottom - smallBoxSize, smallWeaponScale, smallWeaponScale, 0, c_white, 1);
draw_sprite_ext(weaponToDraw[? "uiSprite"], 0, global.uiXMiddle+boxSize+smallBoxSize, global.uiBottom - smallBoxSize, smallWeaponScale, smallWeaponScale, 0, c_white, 1);

if (instance_exists(currentInteraction))
{
	currentInteraction.drawInteraction();
}