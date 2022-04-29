/// @description Insert description here
// You can write your code in this editor


if (input = -1) //KEYBOARD
{
	///moving
	if (state != states.stun)
	{
		var horMove = keyboard_check(global.rightKey) - keyboard_check( global.leftKey);;
		var verMove = keyboard_check(global.downKey) - keyboard_check(global.upKey);
	
		if (horMove != 0 || verMove != 0)
		{
			var moveDirection = point_direction(0, 0, horMove, verMove);
			//phy_position_x += lengthdir_x(moveSpeed, moveDirection);
			//phy_position_y += lengthdir_y(moveSpeed, moveDirection);
			var maxMoveSpeed = moveSpeed;
			if (state != states.idle)
			{
				maxMoveSpeed *= occupiedMoveSpeed;
			}
			if (point_distance(0, 0, phy_linear_velocity_x, phy_linear_velocity_y) < maxMoveSpeed)
			{
				phy_linear_velocity_x += lengthdir_x(acceleration, moveDirection);
				phy_linear_velocity_y += lengthdir_y(acceleration, moveDirection);
			}
			//physics_apply_force(phy_position_x, phy_position_y, horMove, verMove)
		}
		
		//Interacting
		if keyboard_check_pressed(global.interactKey)
		{
			if (instance_exists(currentInteraction))
			{
				currentInteraction.activateInteraction();
			}
		}
	}
	
	///Turning
	mouseDirection = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
	var deltaDirection = mouseDirection-bodyDirection;
	if (deltaDirection != 0)
	{
		if ((deltaDirection > 0 && deltaDirection < 180) || deltaDirection < -180)
		{
			bodyDirection += min(rotateSpeed, abs(deltaDirection));
		}
		else
		{
			bodyDirection -= min(rotateSpeed, abs(deltaDirection));
		}
	}

	while (bodyDirection > 360)
	{
		bodyDirection -= 360;
	}
	while (bodyDirection < 0)
	{
		bodyDirection += 360;
	}
	
	///attacking
	if (state == states.idle && stamina > 0)
	{
		var stateToGoTo = noone;
		if (mouse_check_button(global.attack1)  && mana > weapons[| currentWeapon][? "attack1Mana"])
		{
			currentAttack = weapons[| currentWeapon][? "attack1Type"];
			currentAttackStamina = weapons[| currentWeapon][? "attack1Stamina"];
			currentAttackMana = weapons[| currentWeapon][? "attack1Mana"];
			stateToGoTo = states.attack1;
			currentAttackButton = global.attack1;
		}
		else if (mouse_check_button(global.attack2)  && mana > weapons[| currentWeapon][? "attack2Mana"])
		{
			currentAttack = weapons[| currentWeapon][? "attack2Type"];
			currentAttackStamina = weapons[| currentWeapon][? "attack2Stamina"];
			currentAttackMana = weapons[| currentWeapon][? "attack2Mana"];
			stateToGoTo = states.attack2;
			currentAttackButton = global.attack2;
		}
		if (stateToGoTo != noone)
		{
			switch(currentAttack)
			{
				case attackType.swing:
					state = stateToGoTo;
					weaponRotateRight = 75;
					weaponRotateSpeedRight = 20;
					drainStamina(currentAttackStamina);
					drainMana(currentAttackMana);
					break;
				case attackType.stab:
					state = stateToGoTo;
					weaponRotateRight = 85;
					weaponRotateSpeedRight = 20;
					drainStamina(currentAttackStamina);
					drainMana(currentAttackMana);
					break;
				case attackType.castLight:
					state = stateToGoTo;
					weaponRotateRight = 85;
					weaponRotateSpeedRight = 20;
					drainStamina(currentAttackStamina);
					drainMana(currentAttackMana);
					break;
				case attackType.blockLeftLight:
					state = stateToGoTo;
					weaponRotateLeft = -85;
					weaponRotateSpeedLeft = 25;
					weaponAngleLeft = -80;
					break;
			}
		}
	}
	else if (state == states.attack1 || state == states.attack2)
	{
		switch(currentAttack)
		{
			case attackType.blockLeftLight:
				if (mouse_check_button_released(currentAttackButton))
				{
					weaponRotateLeft = 85;
					weaponRotateSpeedLeft = 25;
					weaponAngleLeft = 0;
					state = states.recover;
				}
				break;
		}
	}
	
	//switching weapons
	if state == states.idle
	{
		if mouse_wheel_up()
		{
			if (currentWeapon < (ds_list_size(weapons)-1))
			{
				currentWeapon++;
			}
			else
			{
				currentWeapon = 0;
			}
			updateWeaponSprite();
		}
		else if mouse_wheel_down()
		{
			if (currentWeapon > 0)
			{
				currentWeapon--;
			}
			else
			{
				currentWeapon = ds_list_size(weapons)-1;
			}
			updateWeaponSprite();
		}
	}
}

//weapon actions

if (weaponRotateRight != 0)
{
	var rotation = sign(weaponRotateRight)*min(weaponRotateSpeedRight, abs(weaponRotateRight));
	weaponRotationRight += rotation;
	weaponRotateRight -= rotation;
	
	if (weaponRotateRight = 0)
	{
		if (state == states.recover)
		{
			state = states.idle;
		}
		else
		{
			switch(currentAttack)
			{
				case attackType.swing:
					weaponRotateRight = -75;
					weaponRotateSpeedRight = 4;
					state = states.recover;
					break;
				case attackType.stab:
					weaponRotateRight = -85;
					weaponRotateSpeedRight = 4;
					//DAMAGE
					if (state == states.attack2)
					{
						scrDamageMobs(currentAttack, bodyDirection, weapons[| currentWeapon][? "attack2Poise"],  weapons[| currentWeapon][? "attack2Value"]);
					}
					else
					{
						scrDamageMobs(currentAttack, bodyDirection, weapons[| currentWeapon][? "attack1Poise"],  weapons[| currentWeapon][? "attack1Value"]);
					}
					state = states.recover;
					break;
				case attackType.castLight:
					weaponRotateRight = -85;
					weaponRotateSpeedRight = 4;
					//CAST
					if (state == states.attack2)
					{
						castSpell(phy_position_x + lengthdir_x(28, bodyDirection), phy_position_y + lengthdir_y(28, bodyDirection), 5, bodyDirection, sprSpellBall, -1, 0.7, c_blue, 1, false, weapons[| currentWeapon][? "attack2Value"], weapons[| currentWeapon][? "attack2Poise"]);
					}
					else
					{
						castSpell(phy_position_x + lengthdir_x(28, bodyDirection), phy_position_y + lengthdir_y(28, bodyDirection), 5, bodyDirection, sprSpellBall, -1, 0.7, c_blue, 1, false, weapons[| currentWeapon][? "attack1Value"], weapons[| currentWeapon][? "attack1Poise"]);
					}
					state = states.recover;
					break;
			}
		}
	}
}
if (weaponRotateLeft != 0)
{
	var rotation = sign(weaponRotateLeft)*min(weaponRotateSpeedLeft,  abs(weaponRotateLeft));
	weaponRotationLeft += rotation;
	weaponRotateLeft -= rotation;
	
	if (weaponRotateLeft = 0)
	{
		if (state == states.recover)
		{
			state = states.idle;
		}
		else
		{
			switch(currentAttack)
			{
				case attackType.swing:
					state = states.recover;
					weaponRotateLeft = 75;
					weaponRotateSpeedLeft = 2;
					break;
				case attackType.stab:
					state = states.recover;
					weaponRotateLeft = 85;
					weaponRotateSpeedLeft = 2;
					break;
				case attackType.castLight:
					weaponRotateRight = 85;
					weaponRotateSpeedRight = 4;
					castSpell(phy_position_x + lengthdir_x(28, bodyDirection), phy_position_y + lengthdir_y(28, bodyDirection), 5, bodyDirection, sprSpellBall, 0.5, 0.5, c_blue, 1, false, weapons[| currentWeapon][? "attack1Value"], weapons[| currentWeapon][? "attack1Poise"]);
					state = states.recover;
					break;
			}
		}
	}
}

if (staminaRegenerating && stamina < maxStamina)
{
	stamina += staminaRegen;
	if (stamina > maxStamina)
	{
		stamina = maxStamina;
	}
}
if (manaRegenerating && mana < maxMana)
{
	mana += manaRegen;
	if (mana > maxMana)
	{
		mana = maxMana;
	}
}

global.playerX = phy_position_x;
global.playerY = phy_position_y;