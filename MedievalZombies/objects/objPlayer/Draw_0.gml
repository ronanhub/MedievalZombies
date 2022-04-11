/// @description Insert description here
// You can write your code in this editor
//statics SHOULD BE STATICIZED LATER
var footOffset = 5;

var drawX = phy_position_x;
var drawY = phy_position_y;

var moveSpeed = point_distance(0, 0, phy_linear_velocity_x, phy_linear_velocity_y);
var drawOffset = scrWave(-1, 1, 1, 0)*moveSpeed*0.11;
//right foot
draw_sprite_ext(footSprite, -1, drawX+lengthdir_x(footOffset, bodyDirection-90)+lengthdir_x(drawOffset, bodyDirection), drawY+lengthdir_y(footOffset, bodyDirection-90)+lengthdir_y(drawOffset, bodyDirection), 1, 1, bodyDirection, c_white, 1);
//left foot
draw_sprite_ext(footSprite, -1, drawX+lengthdir_x(footOffset, bodyDirection+90)+lengthdir_x(-drawOffset, bodyDirection), drawY+lengthdir_y(footOffset, bodyDirection+90)+lengthdir_y(-drawOffset, bodyDirection), 1, 1, bodyDirection, c_white, 1);

draw_sprite_ext(bodySprite, -1, drawX, drawY, 1, 1, bodyDirection, c_white, 1);
draw_sprite_ext(headSprite, -1, drawX, drawY, 1, 1, mouseDirection, c_white, 1);