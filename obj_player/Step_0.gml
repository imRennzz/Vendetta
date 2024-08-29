// Inputs
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;
swapKeyPressed = global.swapKeyPressed;

//Player se movendo
#region
   //Conseguir a direção
   var _horizKey = global.xaxisLeft;
   var _vertKey =  global.yaxisLeft;
   moveDir = point_direction( 0, 0, _horizKey, _vertKey);
   
   //velocidade x e y
   var _spd = 0;
   var _inputLevel = point_distance( 0, 0, _horizKey, _vertKey);
   _inputLevel = clamp(_inputLevel, 0, 1);
   _spd = moveSpd * _inputLevel;
   
   xspd = lengthdir_x( _spd , moveDir);
   yspd = lengthdir_y( _spd , moveDir);
   
   // Colisões
   if place_meeting ( x + xspd, y, obj_wall )
   {
	   xspd = 0;
   }
   
   if place_meeting ( x, y + yspd, obj_wall )
   {
	   yspd = 0;
   }
   
   // Mexendo o player
   x += xspd;
   y += yspd;
   
   // Depth
   depth = -bbox_bottom;
   
   #endregion

// Levando dano
 get_damaged(obj_danoplayer, true);

//Player mirando
 centerY = y + centerYOffSet;
 
 //mira
 if global.controllerMode == 0
 {
 aimDir = point_direction(x, centerY, mouse_x, mouse_y);
 }
 
 if global.controllerMode==1 
{
 if global.xaxisRight != 0 || global.yaxisRight != 0
 {
 aimDir = point_direction(0,0, global.xaxisRight, global.yaxisRight);	
 }
}
//Controle de sprite
#region
//Tenha certeza de deixar o player encarar a direção correta
face = round (aimDir/90);
if face == 4 {face = 0;} ;

//Animação
if xspd == 0 && yspd == 0
{
image_index = 0;
}

//Determinando o sprite do player
mask_index = sprite[3];

sprite_index = sprite[face];
#endregion

//Trocar arma
#region
var _playerWeapons = global.PlayerWeapons;
     //Armas cycle
	 if swapKeyPressed
	 {
	
	//mudar seleção e fude por aí
	selectedWeapon++;
	if selectedWeapon >= array_length(_playerWeapons) {selectedWeapon = 0;};
		 //pegar nova arma
		 weapon = _playerWeapons[selectedWeapon];
	 }
#endregion
//Atirar arma
if shootTimer > 0 { shootTimer--; };

if shootKey && shootTimer <= 0
{
	//Reset timer
	shootTimer = weapon.cooldown;
	
  //Criar bala
  var _xOffSet = lengthdir_x(weapon.lenght + weaponOffsetDist, aimDir);
   var _yOffSet = lengthdir_y(weapon.lenght + weaponOffsetDist, aimDir);
   
   var _spread = weapon.spread;
   var _spreadDiv = _spread / max( weapon.bulletnum-1, 1) ;
   
   var _weaponTipX = x + _xOffSet
   var _weaponTipY = centerY + _yOffSet

audio_play_sound (snd_tiro, 9, false);
   
  //criar numero correto de balas NÃO AGUENTO MAIS SOCORRO AAAAAA
   for (var i = 0; i < weapon.bulletnum; i++) 
   {
  
  var _yOffSet = lengthdir_y(weapon.lenght + weaponOffsetDist, aimDir);
  var _bulletInst = instance_create_depth(x + _xOffSet, centerY + _yOffSet, depth-100, weapon.bulletObj );
  
  //Mudar direção da bala
  with (_bulletInst )
  {
	  dir = other.aimDir - _spread/2 + _spreadDiv*i;
	  
	  //virar a bala pra direção certa
	  if dirFix == true
	  {
        image_angle = dir;
	  }
	  
  }
  
}
}

//Morte
if hp <= 0
{
	//create gameover
	instance_create_depth(0,0,-10000, obj_gameover)
    
	instance_create_depth (x,y, depth, obj_playermorrendo);
	
	audio_play_sound (snd_dead, 11, false);
	
	instance_destroy();
}


