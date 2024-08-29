draw_sprite_ext(  sprite_index, image_index, x, y, face, image_yscale,image_angle, image_blend, image_alpha);

//draw hp
var _healthpercent = hp / maxHp;
var _hpImage = _healthpercent * ( sprite_get_number ( spr_enemyhealth )-1) ;
draw_sprite ( spr_enemyhealth, _hpImage, x, y - sprite_height - 1);



