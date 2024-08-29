//Mexe
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;

//Limpeza

//HitConfirm
if hitConfirm == true && enemyDestroy == true { destroy = true;};

//Destruir
if destroy == true
{		
	//tiro saindo
	create_animated_vfx(spr_tirosaindo, x, y, depth);
	
	
	//destruir
  instance_destroy();
  
  
}

//Colisão
if place_meeting (x, y, obj_solidwall )
{
destroy = true;
}

//Ponto de distância 
if point_distance(xstart, ystart, x, y) > maxDist
{
   destroy = true;	
}

image_angle = dir;
