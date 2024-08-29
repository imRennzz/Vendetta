// Inherit the parent event
event_inherited();

damage = 2;
maxHp = 500;
hp = 500;
spd = 1.4;
dir = 0;
xspd = 0;
yspd = 0;

face = 1;

cooldownTime = 7*10
shootTimer = irandom(cooldownTime);
windupTime = 10;
recoverTime = 15;
bulletInst = noone;

bulletXoff = 28;
bulletYoff = -7;