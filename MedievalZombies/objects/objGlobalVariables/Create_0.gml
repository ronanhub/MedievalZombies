/// @description Insert description here
// You can write your code in this editor
global.upKey = ord("W");
global.downKey = ord("S");
global.leftKey = ord("A");
global.rightKey = ord("D");

global.attack1 = mb_left;
global.attack2 = mb_right;

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
	recover,
	stun
}