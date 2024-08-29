if global.controllerMode= 0
{
global.rightKey = keyboard_check(ord ( "D" ));
global.leftKey = keyboard_check(ord ( "A" ));
global.upKey = keyboard_check(ord ( "W" ));
global.downKey = keyboard_check (ord ( "S" ));

global.xaxisLeft = global.rightKey - global.leftKey;
global.yaxisLeft = global.downKey - global.upKey;

global.shootKey = mouse_check_button(mb_left);
global.swapKeyPressed = mouse_check_button_pressed(mb_right);
} 

//controle

if global.controllerMode == 1
{
var _gamepad = 0;
if gamepad_is_connected(_gamepad)
{
	
	gamepad_set_axis_deadzone(_gamepad,.2)

global.rightKey = gamepad_button_check(_gamepad, gp_padr);		
global.leftKey = gamepad_button_check(_gamepad, gp_padl);	
global.upKey = gamepad_button_check(_gamepad, gp_padu);	
global.downKey = gamepad_button_check(_gamepad, gp_padd);	

global.xaxisLeft = gamepad_axis_value(_gamepad, gp_axislh) + (global.rightKey - global.leftKey);
global.yaxisLeft = gamepad_axis_value(_gamepad, gp_axislv) + (global.downKey - global.upKey);
global.xaxisLeft = clamp ( global.xaxisLeft, -1,1);
global.yaxisLeft = clamp ( global.yaxisLeft, -1,1);

global.xaxisRight = gamepad_axis_value(_gamepad, gp_axisrh);
global.yaxisRight = gamepad_axis_value(_gamepad, gp_axisrv);

global.shootKey = gamepad_button_check(_gamepad, gp_shoulderrb);
global.swapKeyPressed = gamepad_button_check_pressed (_gamepad, gp_shoulderlb);
global.startKeyPressed = gamepad_button_check_pressed (_gamepad, gp_start);


}
}