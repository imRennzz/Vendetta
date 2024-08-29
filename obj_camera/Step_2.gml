//Camera w & h
var _camW = camera_get_view_width(view_camera [0]);
var _camH = camera_get_view_height (view_camera [0]);


//centrar no player
if instance_exists (obj_player)
{
   x= obj_player.x - _camW/2;
   y= obj_player.centerY - _camH/2;
}

//Camera treme

   //x shake
   if xShakeAmount > 0
   {
	 xShakeDir += xShakeSpd;
	 xShakeAmount -= xShakeAmountSpd;
   }  else {
	   xShakeAmount = 0;
	   xShakeDir = 0;
   }
   xShake = dsin (xShakeDir ) * xShakeAmount;   
   
   //y shake
    if yShakeAmount > 0
   {
	 yShakeDir += yShakeSpd;
	 yShakeAmount -= yShakeAmountSpd;
   }  else {
	   yShakeAmount = 0;
	   yShakeDir = 0;
   }
   yShake = dsin (yShakeDir ) * yShakeAmount;   
   
   
   //Add in camera shake
   x += xShake;
   y += yShake;

//Posição da camera
camera_set_view_pos ( view_camera[0], x, y );