//Cam coordenadas
var _camX = camera_get_view_x ( view_camera [0]);
var _camY = camera_get_view_y ( view_camera [0]);
//Coordenada central do HUD
var _border = 8
var _hudX = _camX + _border;
var _hudY = _camY + _border;

//Draw hp
if instance_exists(obj_player)
{
draw_sprite (spr_barradevida, 0, _hudX, _hudY);

for (var i = 0; i < playerMaxhp; i++ )
{
	//mostrar hp atual
	var _img = 1
	if i+1 <= playerHp {_img = 2; };
	
	var _eduardobixa = 3;
    draw_sprite (spr_barradevida, _img, _hudX + _eduardobixa * i, _hudY );	
}
}

//Contador de kills
var _enemyCountOffSet = 24;
var _ecHudX = _hudX;
var _ecHudY = _hudY + _enemyCountOffSet;

//Draw background
draw_sprite (spr_kills, 0, _ecHudX, _ecHudY );

//Draw texto
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(Font1);

draw_text ( _ecHudX + 31, _ecHudY + 5, string (global.enemyKillCount) );