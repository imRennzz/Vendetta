switch (state )
{
case 0:

if instance_exists(obj_player)
{
   dir = point_direction(x,y, obj_player.x, obj_player.y);	
}

depth = -y - 50;
state = 0;

break	;

  //atira
  case 1:
  
  xspd = lengthdir_x(spd, dir);
  yspd = lengthdir_y(spd, dir);
  x += xspd;
  y += yspd;
  
  depth= -y;
  
  break
  
}
if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height
{
   destroy = true;	
}

if hitConfirm == true && playerDestroy == true {destroy = true; } ;

if destroy == true { 
	
	create_animated_vfx(spr_tirosaindo, x, y, depth);
	
	instance_destroy();
	
	};

if place_meeting (x, y, obj_solidwall) { destroy = true; };