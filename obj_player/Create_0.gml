// Dano
 get_damaged_create(15, true);

// Movimento

moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;

//Ocultar mouse
window_set_cursor (cr_none);

// Controle do Sprite
centerYOffSet = -16;
centerY = y = centerYOffSet; //Colocar em Step Event

weaponOffsetDist = 4;
aimDir= 0;

face = 1
sprite[0] = spr_playerdireita;
sprite[1] = spr_playercima;
sprite[2] = spr_playeresquerda;
sprite[3] = spr_playerbaixo;

//Arma info
shootTimer = 0;

//Adicionar armas para inventário
  array_push (global.PlayerWeapons, global.WeaponList.pistola );
  array_push (global.PlayerWeapons, global.WeaponList.uzi );
  array_push (global.PlayerWeapons, global.WeaponList.shotgun );

 selectedWeapon = 0;
weapon = global.PlayerWeapons[selectedWeapon];

