get_damaged(obj_dano);

//Mostrar dano
var _healthPercent = 1 - (hp/maxHp);
image_index = _healthPercent * (image_number - 1);

if hp <= 0
{
  instance_destroy();	
}