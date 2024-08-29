shootKey = global.shootKey;

//Fade in
alpha += alphaspd;
alpha = clamp (alpha, 0, 1);

//restart
if shootKey && alpha >= 1
{
	game_restart();
}