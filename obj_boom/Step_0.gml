get_damaged(obj_dano);

//Mostrar dano
var _healthPercent = 1 - (hp/maxHp);
image_index = _healthPercent * image_number;

if hp <= 0
{
	//Criar explosão
	instance_create_depth (x+8, y+8, -3000, obj_kaboom);
	
	
	screen_shake (10);
	
	audio_play_sound (snd_explosao, 8, false);
	
	//Se destruir
  instance_destroy();	
}