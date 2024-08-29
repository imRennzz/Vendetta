// Perseguir jogador
if instance_exists (obj_player)
{
dir = point_direction(x,y, obj_player.x, obj_player.y);
}

//Conseguir velocidade
xspd = lengthdir_x( spd, dir);
yspd = lengthdir_y( spd, dir);

//Direção correta
   if xspd > 0 {face = 1;};
   if xspd < 0 {face = -1;};
   image_xscale = face;

//Colisões
if place_meeting (x + xspd, y, obj_wall) || place_meeting ( x + xspd, y, obj_enemypai )
{
    xspd = 0;	
}

if place_meeting (x, y + yspd, obj_wall) || place_meeting ( x, y + yspd, obj_enemypai )
{
    yspd = 0;	
}

//Se mexendo
x += xspd;
y += yspd;

shootTimer ++;

if shootTimer = 1
{
   bulletInst = instance_create_depth(x + bulletXoff*face,y + bulletYoff, depth, obj_enemybullet)	
}

if shootTimer == windupTime && instance_exists (bulletInst)
{
   	bulletInst.state = 1;
}

if shootTimer > windupTime + recoverTime
{

shootTimer = 0;

}

// Inherit the parent event
// Leva dano e morre
event_inherited();

if hp <= 0

{
	audio_stop_sound(snd_boss)
	
	room_goto(rm_finalfinal)
}



