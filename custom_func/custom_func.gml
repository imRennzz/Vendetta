// Os recursos de script mudaram para a v2.3.0; veja
// Draw Arma
function draw_my_weapon()
{

//Tirar a arma do corpo do player
var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);

// Virar a arma
var _weaponYscl = 1;
if aimDir > 90 && aimDir < 270
{
_weaponYscl = -1
}

draw_sprite_ext( weapon.sprite, 0, x, centerY, 1, _weaponYscl,  aimDir, c_white, 1);
}

//vfx
function screen_shake ( _amount = 4)
{
	with(obj_camera)
	{
		xShakeAmount = _amount;
		yShakeAmount = _amount;
	}
}
	function create_animated_vfx (_sprite, _x, _y, _depth)
	{
	    	with (instance_create_depth(_x, _y, _depth, obj_animatedVFX) )
			{
			    sprite_index = _sprite;	
				
			}
	}

// Calcular dano
   // Dano criar event
   function get_damaged_create(_hp = 10, _iframes = false )
   {
	   maxHp = _hp;
	hp = _hp;

// Conseguir iframes
 if _iframes == true
 {
    iframeTimer = 0;
	iframeNumber = 90;
 }

if _iframes == false
{
damageList = ds_list_create();   
}
   }

   //NÃO PRECISA USAR se não tiver iframes
   // Dano limpeza event
   function get_damaged_cleanup ()
{

   ds_list_destroy (damageList);
	
}
   // Dano step event
   function get_damaged( _damageObj, _iframes = false )
   {
   
   if _iframes == true && iframeTimer > 0
   {
	 iframeTimer--;
	 
	 if iframeTimer mod 5 == 0
	 {
	if image_alpha == 1
	{
	  image_alpha = 0;	
	} else {
		image_alpha = 1; 
		}
	 }
	  hp = clamp (hp, 0, maxHp);
	  
	 exit;
   }
   
   //Faça iframe blinking parar
   if _iframes == true
   {
   image_alpha = 1;
   }
   
  if place_meeting(x,y, _damageObj) || ( _damageObj != obj_dano && place_meeting (x,y, obj_danotodo))
{
	//Instância única
    var _instList = ds_list_create();
	instance_place_list ( x, y, _damageObj, _instList, false);
	if _damageObj != obj_dano
	{
	instance_place_list ( x, y, obj_danotodo, _instList, false);
	}
	
    var _listSize = ds_list_size (_instList);
	
	var _hitConfirm = false;
	
	for (var i = 0; i < _listSize; i++)
	{
		var _inst = ds_list_find_value (_instList, i);
	
	if _iframes = true || ds_list_find_index ( damageList, _inst ) == -1
	{
		if _iframes == false
		{
		ds_list_add ( damageList, _inst);
		}
	
		hp -= _inst.damage;
		_hitConfirm = true;
		
		_inst.hitConfirm = true;
	}
		
}
	
	if _iframes == true && _hitConfirm
	{
	  iframeTimer = iframeNumber;	
	}
	
	  ds_list_destroy (_instList);
}

if _iframes == false
{
var _damageListSize = ds_list_size (damageList);
for (var i= 0; i < _damageListSize; i ++ )
{
   var _inst = ds_list_find_value ( damageList, i);
if !instance_exists ( _inst) || !place_meeting(x,y, _inst)
{
	ds_list_delete (damageList, i);
	i--;
	_damageListSize--;
}
}
 
}  
 hp = clamp (hp, 0, maxHp);


   }