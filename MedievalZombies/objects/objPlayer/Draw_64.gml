/// @description Insert description here
// You can write your code in this editor

draw_healthbar(0, 0, global.uiscale*3.5, global.uiscale*0.4, (hitpoints / maxHitpoints) * 100, c_gray, c_maroon, c_red, 0, true, true);
draw_healthbar(0, global.uiscale*0.4+2, global.uiscale*3.3, global.uiscale*0.6, (mana / maxMana) * 100, c_gray, c_blue, c_aqua, 0, true, true);
draw_healthbar(0, global.uiscale*0.6+2, global.uiscale*3.3, global.uiscale*0.8, (stamina / maxStamina) * 100, c_gray, c_green, c_lime, 0, true, true);
draw_set_halign(fa_left);
draw_text(10, global.uiscale, "Gold: "+string(gold));

if (instance_exists(currentInteraction))
{
	currentInteraction.drawInteraction();
}