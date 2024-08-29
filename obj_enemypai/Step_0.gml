//Receber dano
get_damaged(obj_danoinimigo)

//morte
if hp <= 0
{
	//add Enemy Count
	global.enemyKillCount++;
	
	//determinando se vai dropar algo
	var _chance = irandom(100);
	
	if _chance < 10
	{
	  //crie a coisa
	  instance_create_depth(x,y,depth, obj_kit);
	}
	
	create_animated_vfx(spr_explosaozinha, x, y, depth);
	
	//Destroy 
  instance_destroy ();	
}

