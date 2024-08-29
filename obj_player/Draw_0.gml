
//Draw arma atrás do player
if aimDir >= 0 && aimDir < 180
{
draw_my_weapon();
}

//Draw mira
draw_sprite (spr_mira, 0, mouse_x, mouse_y);

//Draw player
draw_self();


//Draw arma
if aimDir >= 180 && aimDir < 360
{
draw_my_weapon();
}
