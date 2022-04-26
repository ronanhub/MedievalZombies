/// @description Insert description here
// You can write your code in this editor
text = "";
textColour = c_white;
active = true;

function drawInteraction()
{
	draw_set_colour(textColour);
	draw_set_font(foInteract);
	draw_set_halign(fa_middle);
	draw_text(display_get_gui_width()/2, display_get_gui_height()*0.8, text);
}

function activateInteraction()
{
	
}