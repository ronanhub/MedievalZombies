/// @description Insert description here
// You can write your code in this editor
event_inherited();
text = "START WAVE\n[E]";

function activateInteraction()
{
	if instance_exists(objGameController)
	{
		objGameController.startWaveSwitch();
	}
	with(objStartGameSwitch)
	{
		active = false;
	}
}