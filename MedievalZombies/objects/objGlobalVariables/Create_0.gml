/// @description Insert description here
// You can write your code in this editor
global.level = 1;

global.upKey = ord("W");
global.downKey = ord("S");
global.leftKey = ord("A");
global.rightKey = ord("D");

global.interactKey = ord("E");

global.attack1 = mb_left;
global.attack2 = mb_right;

var cellSize = 16;
global.collisionGrid = mp_grid_create(0,0, room_width div cellSize, room_height div cellSize, cellSize, cellSize);

global.playerX = 32;
global.playerY = 32;

global.uiScale = 100;
global.uiHeight = display_get_gui_height();
global.uiWidth = display_get_gui_width();
global.uiBottom = global.uiHeight-1;
global.uiRight = global.uiWidth-1;
global.uiXMiddle = global.uiWidth/2;
global.uiYMiddle = global.uiHeight/2;

for(var xx = 0; xx < room_width div cellSize; xx++)
{
	for(var yy = 0; yy < room_height div cellSize; yy++)
	{
		if !place_free(xx*cellSize+cellSize/2, yy*cellSize+cellSize/2)
		{
			mp_grid_add_cell(global.collisionGrid, xx, yy);
		}
	}
}


enum attackType
{
	swing,
	stab,
	overhead,
	longswing,
	longstab,
	longoverhead,
	castLight,
	castMedium,
	castHeavy,
	shoot,
	drawLight,
	drawMedium,
	drawHeavy,
	blockLeftLight,
	blockLeftMedium,
	blockLeftHeavy
}

enum states
{
	idle,
	attack1,
	attack2,
	lunge,
	recover,
	stun
}