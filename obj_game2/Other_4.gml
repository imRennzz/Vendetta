
if audio_is_playing(snd_gamemusic1)

{
   audio_stop_sound(snd_gamemusic1)

   if !audio_is_playing(snd_gamemusic2)
{
	audio_play_sound(snd_gamemusic2, 20, true);
}

}