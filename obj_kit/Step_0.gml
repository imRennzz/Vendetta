//Flutua
floatDir += floatSpd
y = ystart + lengthdir_y (2, floatDir);




//Player coleta


if place_meeting(x,y, obj_player)
{
    obj_player.hp += heal;
	
	audio_play_sound (snd_healup, 10, false);
	
	instance_destroy();
	
}